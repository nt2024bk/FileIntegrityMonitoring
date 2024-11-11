
---

### 3. **Email Report Script: `email_report.sh`**

This script emails the integrity report to a specified recipient.

#### Script: `email_report.sh`
```bash
#!/bin/bash
# email_report.sh
# Description: Sends the integrity report via email.
# Author: [Your Name]
# Version: 1.0

REPORT_FILE="/var/log/integrity_report.txt"
EMAIL="security@example.com"
SUBJECT="File Integrity Report - $(date +%Y-%m-%d)"

if [[ -f "$REPORT_FILE" ]]; then
    mail -s "$SUBJECT" "$EMAIL" < "$REPORT_FILE"
    echo "[INFO] Report sent to $EMAIL"
else
    echo "[ERROR] Report file not found."
fi
