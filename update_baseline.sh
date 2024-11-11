
---

### 2. **Baseline Update Script: `update_baseline.sh`**

This script updates the baseline file after verifying that the changes are expected.

#### Script: `update_baseline.sh`
```bash
#!/bin/bash
# update_baseline.sh
# Description: Updates the integrity baseline after reviewing changes.
# Author: [Your Name]
# Version: 1.0

BASELINE_FILE="/var/log/integrity_baseline.txt"
MONITOR_DIR="/etc"

echo "[INFO] Updating baseline..."
find "$MONITOR_DIR" -type f -exec sha256sum {} \; > "$BASELINE_FILE"
echo "[INFO] Baseline updated at $BASELINE_FILE"
