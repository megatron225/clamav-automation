#!/usr/bin/env bash

# ClamAV Automated Security Scan
# Scan selected directories and record results.

set -u
umask 077
OVERALL_STATUS=0

SCAN_DIRS=(
    "$HOME/Documents"
    "$HOME/Downloads"
)

LOG_DIR="$HOME/clamav-logs"
LOG_FILE="$LOG_DIR/scan-$(date +%F_%H-%M-%S).log"

mkdir -p "$LOG_DIR"
chmod 700 "$LOG_DIR"

echo "ClamAV Scan Started: $(date)" | tee "$LOG_FILE"

for DIR in "${SCAN_DIRS[@]}"; do
    if [[ -d "$DIR" ]]; then
        echo "Scanning: $DIR" | tee -a "$LOG_FILE"

        clamdscan --fdpass --multiscan --infected "$DIR" \
            >> "$LOG_FILE" 2>&1

        RESULT=$?

        case "$RESULT" in
            0) echo "RESULT: Clean" | tee -a "$LOG_FILE" ;;
            1) echo "RESULT: Threat detected" | tee -a "$LOG_FILE"
               if [[ "$OVERALL_STATUS" -eq 0 ]]; then
	          OVERALL_STATUS=1
               fi
               ;;
            *) echo "RESULT: Scan error ($RESULT)" | tee -a "$LOG_FILE"
               OVERALL_STATUS=2 ;;
        esac
    else
        echo "ERROR: Directory not found: $DIR" | tee -a "$LOG_FILE"
        OVERALL_STATUS=2
    fi
done

echo "ClamAV Scan Finished: $(date)" | tee -a "$LOG_FILE"
exit "$OVERALL_STATUS"
