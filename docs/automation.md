# Scan Automation

I configured a systemd user service and timer to run my ClamAV scan script daily at 6:00 p.m.

## How it works

- The timer schedules `clamav-scan.service`.
- The service runs the Bash scan script once.
- The script scans the configured directories and writes results to a log file.
- Service output is also available in the user systemd journal.

## Configuration files

- [Scan service](../systemd/clamav-scan.service)
- [Daily timer](../systemd/clamav-scan.timer)
- [Scan script](../scripts/clamav-scan.sh)

The service uses `%h` to represent the current user's home directory. The script's location in `ExecStart` must match where it is installed.

The timer uses `Persistent=true` to catch up on a missed scheduled run when the user timer becomes active again. It does not wake a sleeping or powered-off laptop.

## Check the timer and service

```bash
systemctl --user status clamav-scan.timer
systemctl --user list-timers --all
systemctl --user status clamav-scan.service

## View service logs

```bash
journalctl --user -u clamav-scan.service
```

[Back to the project overview](../README.md)
