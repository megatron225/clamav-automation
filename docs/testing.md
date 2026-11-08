# Testing ClamAV

## EICAR detection test

I used the EICAR antivirus test file to verify that ClamAV could detect a known test signature. EICAR is a harmless test file designed for checking antivirus detection.

I downloaded the EICAR test file to a temporary location:

```bash
curl -fsSL https://secure.eicar.org/eicar.com.txt -o /tmp/eicar-clamav-test.com
```

I then scanned it with `clamdscan` using the `--fdpass` option:

```bash
clamdscan --fdpass --verbose /tmp/eicar-clamav-test.com
```
The result displayed:

```text
Eicar-Test-Signature FOUND
Infected files: 1
```
![ClamAV detecting the EICAR test signature](../Privacy-redacted%20terminal%20screenshot.png)

This confirmed that ClamAV detected the test signature. Afterward, I removed the test file.

After the test, I removed the file:

```bash
rm -i /tmp/eicar-clamav-test.com
```

The `-i` option prompted me to confirm before deleting it.

## Automated scan test

I also tested the Bash script against my configured directories. The scan reported clean results and returned exit code `0`.

My project progress tracker records a later scheduled scan starting at 6:00:01 p.m. and finishing at 6:00:06 p.m.

[Back to the project overview](../README.md)
