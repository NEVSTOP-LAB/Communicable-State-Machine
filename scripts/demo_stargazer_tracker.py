#!/usr/bin/env python3
"""
Simple Stargazer Tracker Demo

This is a demonstration version that shows the structure and expected output.
In a real environment with proper GitHub access, this would fetch actual data.
"""

import json
from datetime import datetime, timedelta

def create_demo_report():
    """Create a demonstration report showing the expected output format."""
    
    # This would be replaced with actual GitHub API calls
    demo_data = {
        "organization": "NEVSTOP-LAB",
        "scan_date": datetime.now().isoformat(),
        "days_back": 30,
        "repositories": {
            "Communicable-State-Machine": {
                "total_stars": 45,
                "recent_stars": 3,
                "recent_stargazers": [
                    {
                        "user": "example_user1",
                        "user_url": "https://github.com/example_user1",
                        "starred_at": "2024-08-20T10:30:00Z",
                        "user_type": "User"
                    },
                    {
                        "user": "example_user2", 
                        "user_url": "https://github.com/example_user2",
                        "starred_at": "2024-08-18T15:45:00Z",
                        "user_type": "User"
                    },
                    {
                        "user": "devteam_org",
                        "user_url": "https://github.com/devteam_org", 
                        "starred_at": "2024-08-15T09:20:00Z",
                        "user_type": "Organization"
                    }
                ]
            },
            "CSM-API-String-Arugments-Support": {
                "total_stars": 12,
                "recent_stars": 0,
                "recent_stargazers": []
            }
        }
    }
    
    # Save demo report
    with open("demo_stargazer_report.json", "w") as f:
        json.dump(demo_data, f, indent=2)
    
    # Print demo summary
    print("="*60)
    print("DEMO STARGAZER REPORT FOR NEVSTOP-LAB")
    print("="*60)
    print(f"Scan Date: {demo_data['scan_date']}")
    print(f"Looking back: {demo_data['days_back']} days")
    print()
    
    for repo_name, repo_data in demo_data["repositories"].items():
        recent_count = repo_data["recent_stars"]
        total_count = repo_data["total_stars"]
        
        if recent_count > 0:
            print(f"⭐ {repo_name}: {recent_count} recent stars (total: {total_count})")
            
            for stargazer in repo_data["recent_stargazers"]:
                starred_date = datetime.fromisoformat(stargazer["starred_at"].replace('Z', '+00:00'))
                print(f"   - {stargazer['user']} ({stargazer['user_type']}) on {starred_date.strftime('%Y-%m-%d %H:%M')}")
        else:
            print(f"   {repo_name}: No recent stars (total: {total_count})")
    
    print("\n" + "="*60)
    print("SUMMARY:")
    print("Repositories with recent stars: 1")
    print("Total recent stars: 3")
    print("="*60)
    print("\nDemo report saved to: demo_stargazer_report.json")
    print("\nNote: This is a demonstration. Use stargazer_tracker.py with proper")
    print("GitHub API access to get real data.")

if __name__ == "__main__":
    create_demo_report()