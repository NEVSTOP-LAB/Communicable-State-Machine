#!/usr/bin/env python3
"""
GitHub Stargazer Tracker for NEVSTOP-LAB Organization

This script tracks recent stargazers for repositories in the NEVSTOP-LAB organization.
It can be run manually or scheduled to monitor repository stars over time.
"""

import json
import os
import sys
from datetime import datetime, timedelta
from typing import Dict, List, Optional
import argparse

try:
    import requests
except ImportError:
    print("Error: requests library not found. Please install with: pip install requests")
    sys.exit(1)


class StargazerTracker:
    """Track stargazers for GitHub repositories in an organization."""
    
    def __init__(self, org_name: str = "NEVSTOP-LAB", github_token: Optional[str] = None):
        """
        Initialize the stargazer tracker.
        
        Args:
            org_name: GitHub organization name
            github_token: GitHub API token (optional, but recommended for higher rate limits)
        """
        self.org_name = org_name
        self.github_token = github_token
        self.session = requests.Session()
        
        if github_token:
            self.session.headers.update({"Authorization": f"token {github_token}"})
        
        self.session.headers.update({
            "Accept": "application/vnd.github.star+json",
            "User-Agent": "NEVSTOP-LAB-Stargazer-Tracker"
        })
    
    def get_org_repositories(self) -> List[Dict]:
        """Get all repositories for the organization."""
        repos = []
        page = 1
        
        while True:
            url = f"https://api.github.com/orgs/{self.org_name}/repos"
            params = {"page": page, "per_page": 100, "type": "all", "sort": "updated"}
            
            response = self.session.get(url, params=params)
            response.raise_for_status()
            
            page_repos = response.json()
            if not page_repos:
                break
                
            repos.extend(page_repos)
            page += 1
        
        return repos
    
    def get_stargazers_with_timestamps(self, repo_name: str) -> List[Dict]:
        """Get stargazers for a repository with timestamps."""
        stargazers = []
        page = 1
        
        while True:
            url = f"https://api.github.com/repos/{self.org_name}/{repo_name}/stargazers"
            params = {"page": page, "per_page": 100}
            
            response = self.session.get(url, params=params)
            
            # If we get a 403 or other auth error, try without special headers
            if response.status_code == 403:
                # Try with standard headers
                headers = {"User-Agent": "NEVSTOP-LAB-Stargazer-Tracker"}
                if self.github_token:
                    headers["Authorization"] = f"token {self.github_token}"
                
                response = self.session.get(url, params=params, headers=headers)
            
            response.raise_for_status()
            
            page_stargazers = response.json()
            if not page_stargazers:
                break
                
            stargazers.extend(page_stargazers)
            page += 1
        
        return stargazers
    
    def filter_recent_stargazers(self, stargazers: List[Dict], days: int = 30) -> List[Dict]:
        """Filter stargazers to only include those from the last N days."""
        cutoff_date = datetime.now() - timedelta(days=days)
        recent_stargazers = []
        
        for stargazer in stargazers:
            # Check if we have starred_at timestamp
            if 'starred_at' in stargazer:
                starred_at = datetime.fromisoformat(stargazer['starred_at'].replace('Z', '+00:00'))
                if starred_at.replace(tzinfo=None) > cutoff_date:
                    recent_stargazers.append(stargazer)
            else:
                # If no timestamp, we can't filter by date, so include all
                # This happens when the API doesn't provide timestamps
                recent_stargazers.append(stargazer)
        
        return recent_stargazers
    
    def track_recent_stargazers(self, days: int = 30, repos: Optional[List[str]] = None) -> Dict:
        """
        Track recent stargazers across specified repositories.
        
        Args:
            days: Number of days to look back for recent stars
            repos: List of repository names to check (if None, checks all org repos)
        
        Returns:
            Dictionary with stargazer data
        """
        print(f"Tracking stargazers for {self.org_name} organization...")
        
        if repos is None:
            print("Fetching organization repositories...")
            org_repos = self.get_org_repositories()
            repos = [repo['name'] for repo in org_repos]
        
        results = {
            "organization": self.org_name,
            "scan_date": datetime.now().isoformat(),
            "days_back": days,
            "repositories": {}
        }
        
        for repo_name in repos:
            print(f"Checking stargazers for {repo_name}...")
            try:
                stargazers = self.get_stargazers_with_timestamps(repo_name)
                recent_stargazers = self.filter_recent_stargazers(stargazers, days)
                
                results["repositories"][repo_name] = {
                    "total_stars": len(stargazers),
                    "recent_stars": len(recent_stargazers),
                    "recent_stargazers": [
                        {
                            "user": s["user"]["login"],
                            "user_url": s["user"]["html_url"],
                            "starred_at": s.get("starred_at", "timestamp_not_available"),
                            "user_type": s["user"]["type"]
                        }
                        for s in recent_stargazers
                    ]
                }
                
                if recent_stargazers:
                    print(f"  Found {len(recent_stargazers)} recent stars!")
                    # Show note if timestamps aren't available
                    if recent_stargazers and 'starred_at' not in recent_stargazers[0]:
                        print(f"  Note: Timestamps not available, showing all {len(stargazers)} stargazers")
                else:
                    if stargazers and 'starred_at' in stargazers[0]:
                        print(f"  No recent stars in the last {days} days.")
                    else:
                        print(f"  Found {len(stargazers)} total stars (timestamps not available for filtering).")
                    
            except requests.exceptions.RequestException as e:
                print(f"  Error fetching data for {repo_name}: {e}")
                results["repositories"][repo_name] = {"error": str(e)}
        
        return results
    
    def save_results(self, results: Dict, output_file: str = "stargazer_report.json"):
        """Save results to a JSON file."""
        with open(output_file, 'w') as f:
            json.dump(results, f, indent=2)
        print(f"Results saved to {output_file}")
    
    def print_summary(self, results: Dict):
        """Print a human-readable summary of the results."""
        print(f"\n{'='*60}")
        print(f"STARGAZER REPORT FOR {results['organization'].upper()}")
        print(f"{'='*60}")
        print(f"Scan Date: {results['scan_date']}")
        print(f"Looking back: {results['days_back']} days")
        print()
        
        total_recent_stars = 0
        repos_with_stars = 0
        
        for repo_name, repo_data in results["repositories"].items():
            if "error" in repo_data:
                print(f"❌ {repo_name}: Error - {repo_data['error']}")
                continue
            
            recent_count = repo_data["recent_stars"]
            total_count = repo_data["total_stars"]
            
            if recent_count > 0:
                repos_with_stars += 1
                total_recent_stars += recent_count
                print(f"⭐ {repo_name}: {recent_count} recent stars (total: {total_count})")
                
                for stargazer in repo_data["recent_stargazers"]:
                    if stargazer["starred_at"] != "timestamp_not_available":
                        starred_date = datetime.fromisoformat(stargazer["starred_at"].replace('Z', '+00:00'))
                        print(f"   - {stargazer['user']} ({stargazer['user_type']}) on {starred_date.strftime('%Y-%m-%d %H:%M')}")
                    else:
                        print(f"   - {stargazer['user']} ({stargazer['user_type']}) [timestamp not available]")
            else:
                print(f"   {repo_name}: No recent stars (total: {total_count})")
        
        print(f"\n{'='*60}")
        print(f"SUMMARY:")
        print(f"Repositories with recent stars: {repos_with_stars}")
        print(f"Total recent stars: {total_recent_stars}")
        print(f"{'='*60}")


def main():
    """Main entry point for the script."""
    parser = argparse.ArgumentParser(description="Track recent stargazers for NEVSTOP-LAB repositories")
    parser.add_argument("--days", type=int, default=30, help="Number of days to look back (default: 30)")
    parser.add_argument("--repos", nargs="+", help="Specific repositories to check (default: all org repos)")
    parser.add_argument("--output", default="stargazer_report.json", help="Output file for JSON report")
    parser.add_argument("--token", help="GitHub API token (or set GITHUB_TOKEN env var)")
    parser.add_argument("--org", default="NEVSTOP-LAB", help="GitHub organization name")
    
    args = parser.parse_args()
    
    # Get GitHub token from argument or environment
    github_token = args.token or os.getenv("GITHUB_TOKEN")
    if not github_token:
        print("Warning: No GitHub token provided. API rate limits will be lower.")
        print("Set GITHUB_TOKEN environment variable or use --token argument for better performance.")
    
    # Initialize tracker
    tracker = StargazerTracker(org_name=args.org, github_token=github_token)
    
    try:
        # Track stargazers
        results = tracker.track_recent_stargazers(days=args.days, repos=args.repos)
        
        # Save and display results
        tracker.save_results(results, args.output)
        tracker.print_summary(results)
        
    except requests.exceptions.RequestException as e:
        print(f"Error communicating with GitHub API: {e}")
        sys.exit(1)
    except KeyboardInterrupt:
        print("\nOperation cancelled by user.")
        sys.exit(1)
    except Exception as e:
        print(f"Unexpected error: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()