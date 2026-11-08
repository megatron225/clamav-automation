# ClamAV Malware Scan Automation on Linux Mint
ClamAV malware scanning on a Linux Mint laptop, automated with Bash and a daily systemd timer.

## Project Overview

This project documents how I configured ClamAV on my Linux Mint laptop to scan selected directories for malware. I created a Bash script to run the scans and record the results, then configured a systemd user timer to run the script daily at 6:00 p.m.

I tested ClamAV detection using the EICAR antivirus test file and troubleshot a file-access issue using the `--fdpass` option.

## Environment

| Component | Details |
| --- | --- |
| Operating system | Linux Mint 22.3 |
| Antivirus | ClamAV 1.5.4 |
| Scripting | Bash |
| Automation | systemd user service and timer |
| Scan schedule | Daily at 6:00 p.m. |
| Directories scanned | Documents and Downloads |

## Project Milestones

- Verified the ClamAV installation and daemon.
- Tested malware detection using the EICAR test file.
- Troubleshot a scan permission issue.
- Created a Bash script to scan selected directories and log results.
- Configured a systemd user service and daily timer.
- Recorded a successful scheduled scan in the project progress tracker.
- Checked the current script for Bash syntax errors.

## Scan Script

The [scan script](scripts/clamav-scan.sh) scans selected directories with ClamAV and saves the results to a log file.

The directory names in the repository are examples. Update `SCAN_DIRS` in the script to match the directories you want to scan.

## Troubleshooting

During setup, I investigated a file-access error with `clamdscan` and corrected a variable typo in the scan script.

See the [troubleshooting notes](docs/troubleshooting.md) for details.

## Automated Scanning

A systemd user timer schedules the scan daily at 6:00 p.m. The service runs the scan script and records its output in the user journal.

See [Scan Automation](docs/automation.md) for configuration details and commands to check the timer and logs.

## Testing

I tested ClamAV detection with the EICAR antivirus test file and verified that my scan script could complete successfully.

See [Testing ClamAV](docs/testing.md) for the commands and results.
