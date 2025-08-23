#!/bin/bash
#
# Quick stargazer tracking script for NEVSTOP-LAB
#
# Usage:
#   ./track_stars.sh                    # Track last 30 days for all repos
#   ./track_stars.sh 7                  # Track last 7 days for all repos
#   ./track_stars.sh 14 CSM-repo1 CSM-repo2  # Track specific repos for 14 days
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DAYS=${1:-30}
shift  # Remove first argument (days) from $@

# Check if Python and dependencies are available
if ! command -v python3 &> /dev/null; then
    echo "Error: python3 is required but not installed."
    exit 1
fi

# Check if requests is installed
if ! python3 -c "import requests" 2>/dev/null; then
    echo "Installing required dependencies..."
    pip3 install -r "$SCRIPT_DIR/requirements.txt"
fi

# Build the command
CMD="python3 $SCRIPT_DIR/stargazer_tracker.py --days $DAYS"

# Add specific repositories if provided
if [ $# -gt 0 ]; then
    CMD="$CMD --repos $@"
fi

# Add output file with timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
CMD="$CMD --output stargazer_report_$TIMESTAMP.json"

echo "Tracking stargazers for the last $DAYS days..."
if [ $# -gt 0 ]; then
    echo "Repositories: $@"
else
    echo "All NEVSTOP-LAB repositories"
fi
echo ""

# Run the command
eval $CMD