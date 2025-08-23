# Stargazer Tracker for NEVSTOP-LAB

This tool helps you track who has recently starred repositories in the NEVSTOP-LAB organization on GitHub.

## Features

- Track recent stargazers across all organization repositories
- Filter by time period (e.g., last 7, 30, or 90 days)
- Monitor specific repositories or all repositories
- Export results to JSON format
- Display human-readable summary reports
- Support for GitHub API authentication for higher rate limits

## Installation

1. **Install Python dependencies:**
   ```bash
   cd scripts
   pip install -r requirements.txt
   ```

2. **Set up GitHub API token (recommended):**
   
   For better API rate limits, create a GitHub personal access token:
   - Go to GitHub Settings > Developer settings > Personal access tokens
   - Create a new token with `public_repo` scope
   - Set it as an environment variable:
     ```bash
     export GITHUB_TOKEN=your_token_here
     ```

## Usage

### Basic Usage

Track stargazers from the last 30 days across all NEVSTOP-LAB repositories:
```bash
python stargazer_tracker.py
```

### Track Specific Time Periods

Track stargazers from the last 7 days:
```bash
python stargazer_tracker.py --days 7
```

Track stargazers from the last 90 days:
```bash
python stargazer_tracker.py --days 90
```

### Monitor Specific Repositories

Track only specific repositories:
```bash
python stargazer_tracker.py --repos Communicable-State-Machine CSM-API-String-Arugments-Support
```

### Custom Output File

Save results to a custom file:
```bash
python stargazer_tracker.py --output my_stargazer_report.json
```

### Use Custom GitHub Token

Provide GitHub token directly:
```bash
python stargazer_tracker.py --token your_github_token_here
```

### Monitor Different Organization

Track a different organization:
```bash
python stargazer_tracker.py --org your-organization-name
```

## Output

The script generates two types of output:

### 1. Console Summary
A human-readable summary showing:
- Repositories with recent stars
- Stargazer usernames and dates
- Total statistics

Example:
```
============================================================
STARGAZER REPORT FOR NEVSTOP-LAB
============================================================
Scan Date: 2024-08-23T14:55:00.123456
Looking back: 30 days

⭐ Communicable-State-Machine: 3 recent stars (total: 45)
   - johndoe (User) on 2024-08-20 10:30
   - alice_coder (User) on 2024-08-18 15:45
   - devteam (Organization) on 2024-08-15 09:20

   CSM-API-String-Arugments-Support: No recent stars (total: 12)

============================================================
SUMMARY:
Repositories with recent stars: 1
Total recent stars: 3
============================================================
```

### 2. JSON Report
Detailed JSON file with complete data:
- Repository information
- Stargazer details with timestamps
- User profiles and types
- Scan metadata

## Configuration

You can customize default settings by editing `config.json`:

```json
{
  "organization": "NEVSTOP-LAB",
  "default_days_back": 30,
  "repositories_to_monitor": [
    "Communicable-State-Machine",
    "CSM-API-String-Arugments-Support"
  ],
  "output_settings": {
    "json_file": "stargazer_report.json",
    "include_user_details": true
  }
}
```

## Rate Limits

- **Without GitHub token**: 60 requests per hour
- **With GitHub token**: 5,000 requests per hour

For organizations with many repositories, using a GitHub token is highly recommended.

## Command Line Options

```
usage: stargazer_tracker.py [-h] [--days DAYS] [--repos REPOS [REPOS ...]]
                           [--output OUTPUT] [--token TOKEN] [--org ORG]

Track recent stargazers for NEVSTOP-LAB repositories

optional arguments:
  -h, --help            show this help message and exit
  --days DAYS           Number of days to look back (default: 30)
  --repos REPOS [REPOS ...]
                        Specific repositories to check (default: all org repos)
  --output OUTPUT       Output file for JSON report
  --token TOKEN         GitHub API token (or set GITHUB_TOKEN env var)
  --org ORG            GitHub organization name
```

## Automation

You can automate this tool to run periodically using:

- **Cron (Linux/Mac)**: Add to crontab to run daily/weekly
- **GitHub Actions**: Use the provided workflow file
- **Task Scheduler (Windows)**: Set up scheduled execution

Example cron entry for weekly reports:
```bash
0 9 * * 1 cd /path/to/repo/scripts && python stargazer_tracker.py --days 7
```

## Troubleshooting

### Common Issues

1. **"requests library not found"**
   - Install dependencies: `pip install -r requirements.txt`

2. **Rate limit exceeded**
   - Set up GitHub token for higher limits
   - Use `--days` to reduce the time window

3. **No recent stargazers found**
   - Try increasing `--days` parameter
   - Check if repositories actually have stars

4. **Permission denied errors**
   - Ensure your GitHub token has correct permissions
   - Check if repositories are public or if you have access

### Getting Help

For issues specific to this tool, check the repository issues or create a new one with:
- Command you ran
- Error message
- Expected vs actual behavior

## Examples

### Daily Monitoring
Monitor yesterday's stars:
```bash
python stargazer_tracker.py --days 1
```

### Weekly Report
Generate a weekly stargazer report:
```bash
python stargazer_tracker.py --days 7 --output weekly_stars.json
```

### Focus on Main Repository
Track only the main CSM repository:
```bash
python stargazer_tracker.py --repos Communicable-State-Machine --days 14
```