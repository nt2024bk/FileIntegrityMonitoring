
---

### 4. **Combined Cron Setup: `fim_cron_setup.sh`**

This script sets up all the cron jobs for automation.

#### Script: `fim_cron_setup.sh`
```bash
#!/bin/bash
# fim_cron_setup.sh
# Description: Sets up cron jobs for file integrity monitoring, baseline updates, and email reporting.
# Author: [Your Name]
# Version: 1.0

(crontab -l 2>/dev/null; echo "0 0 * * * /path/to/integrity_check.sh") | crontab -
(crontab -l 2>/dev/null; echo "0 3 * * 0 /path/to/update_baseline.sh") | crontab -
(crontab -l 2>/dev/null; echo "0 1 * * * /path/to/email_report.sh") | crontab -

echo "[INFO] Cron jobs set up successfully."
