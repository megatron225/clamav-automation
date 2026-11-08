# Troubleshooting

## ClamAV scan permission issue

### Problem

While testing `clamdscan`, I received a `Permission denied` error when scanning a file in my home directory. The scan reported an error instead of completing successfully.

### Investigation

I repeated the command with `sudo`, but the same error appeared. I then tested the `--fdpass` option.

### Resolution

Using `--fdpass` allowed the scan to complete successfully:

```bash
clamdscan --fdpass --verbose "$HOME/.bashrc"
```

The scan reported **0 infected files** and **0 errors**. I included `--fdpass` in my automated scan script.

## Bash script variable typo

During a later review of the script, I found that the variable used when a directory was missing was misspelled. This could have caused the script to report a successful exit code even after encountering a missing directory.

I corrected the variable name and checked the script's syntax:

```bash
bash -n "$HOME/scripts/clamav/clamav-scan.sh"
```

The syntax check passed.
