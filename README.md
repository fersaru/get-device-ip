# get-device-ip

When a device doesn't have a lease, the script exits with 1.

Demo:
```bash
./get-ip.sh pfc200g1
```

When a device is listed twice, the first hit in the device list is checked.
- _TODO: check all listed devices and return first device with lease or exit with 1_

When a device is not listed, the script exits with 1.

When no device is given as argument, the first device is checked.
- _TODO: check all listed devices and return first device with lease or exit with 1_
