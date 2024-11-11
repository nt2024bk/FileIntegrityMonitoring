#!/bin/bash
# integrity_check.sh
# Description: Monitors file integrity by comparing current file hashes with a baseline.
# Author: [Your Name]
# Version: 1.0

BASELINE_FILE="/var/log/integrity_baseline.txt"
MONITOR_DIR="/etc"
REPORT_FILE="/var/log/integrity_report.txt"

# Generate baseline if it doesn't exist
if [[ ! -f "$BASELINE_FILE" ]]; then
    echo "[INFO] Baseline not found. Creating a new baseline..."
    find "$MONITOR_DIR" -type f -exec sha256sum {} \; > "$BASELINE_FILE"
    echo "[INFO] Baseline created at $BASELINE_FILE"
    exit 0
fi

# Check for changes
echo "File Integrity Check Report - $(date)" > "$REPORT_FILE"
echo "=====================================" >> "$REPORT_FILE"

while read -r line; do
    HASH=$(echo "$line" | awk '{print $1}')
    FILE=$(echo "$line" | awk '{print $2}')

    if [[ -f "$FILE" ]]; then
        CURRENT_HASH=$(sha256sum "$FILE" | awk '{print $1}')
        if [[ "$HASH" != "$CURRENT_HASH" ]]; then
            echo "[WARNING] File changed: $FILE" >> "$REPORT_FILE"
        fi
    else
        echo "[ALERT] File deleted: $FILE" >> "$REPORT_FILE"
    fi
done < "$BASELINE_FILE"

echo "[INFO] Integrity check completed. Report saved at $REPORT_FILE"
