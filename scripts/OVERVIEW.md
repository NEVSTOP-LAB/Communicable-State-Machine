# Scripts Directory

This directory contains development and maintenance tools for the NEVSTOP-LAB Communicable State Machine project.

## Contents

### Stargazer Tracking Tools

**Primary Tool:**
- `stargazer_tracker.py` - Main Python script for tracking GitHub stargazers
- `README.md` - Comprehensive documentation and usage examples

**Supporting Files:**
- `requirements.txt` - Python dependencies
- `config.json` - Configuration settings and defaults
- `track_stars.sh` - Convenience shell script wrapper
- `demo_stargazer_tracker.py` - Demonstration version with sample output

**GitHub Integration:**
- `../github/workflows/track-stargazers.yml` - Automated GitHub Actions workflow

## Quick Start

1. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

2. **Basic usage:**
   ```bash
   python stargazer_tracker.py --days 30
   ```

3. **With shell script:**
   ```bash
   ./track_stars.sh 7
   ```

## Purpose

These tools help NEVSTOP-LAB organization members and maintainers to:
- Monitor community engagement through GitHub stars
- Track growth patterns across repositories
- Identify active community members
- Generate reports for project statistics

## Output Files

Generated reports are automatically excluded from git via `.gitignore`:
- `stargazer_report.json` - Default output file
- `*_stargazer_report.json` - Timestamped reports
- `demo_stargazer_report.json` - Demo output

## GitHub Token

For best performance and to avoid rate limits:
1. Create a GitHub Personal Access Token with `public_repo` scope
2. Set as environment variable: `export GITHUB_TOKEN=your_token`
3. Or pass directly: `python stargazer_tracker.py --token your_token`

## Automation

The included GitHub Actions workflow can run automatically on schedule or manual trigger to generate regular stargazer reports.

For detailed usage instructions, see `README.md` in this directory.