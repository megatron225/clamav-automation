# ClamAV Setup and Verification

## Environment

I configured ClamAV 1.5.4 on my Linux Mint 22.3 laptop.

## Verify the installed version

```bash
clamscan --version
```

This displayed the installed ClamAV version and signature database information.

## Check the daemon

```bash
systemctl status clamav-daemon
```

The daemon status showed `active (running)` after setup.

During setup, the daemon initially did not start because a database-file condition was unmet. See the [troubleshooting notes](troubleshooting.md) for the permission issue and other troubleshooting details.

## Next steps

- [Read about scan automation](automation.md)
- [View detection and scan tests](testing.md)
- [Return to the project overview](../README.md)
