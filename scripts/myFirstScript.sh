#!/bin/bash

# -----configuration-------
VERSION="1.0.0"
LOG_FILE="../logs/myFirstScript.log"

#setting up logging
exec> >(tee -a "$LOG_FILE") 2>&1

#-----formatting helper---------
separator() { echo "=================================================="; }

#execution
separator
echo "RUNNING: myfirstScript v$VERSION"
echo "TIMESTAMP: $(date '+%Y-%m-%d %H:%M:%S')"
echo "USER: $USER"
separator

echo "Hi Hamza, starting system check......"

#------checking disk health---------
df -h / && echo "[OK] Disk check complete!!" || { echo "[FAIL] Disk check failed!!"; exit 1; }

#cleaning old logs
echo "Clearing old logs (keeping last 40 lines)"
tail -n 40 "$LOG_FILE" > "$LOG_FILE.tmp" && mv "$LOG_FILE.tmp" "$LOG_FILE" || echo "[WARNING] Log rotation failed!!"

exit 0
