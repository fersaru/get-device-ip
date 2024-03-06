# get-device-ip

Try it out:
```bash
./get-ip.sh foo device-list lease-list
```

## todos
- When a device is listed twice, the first hit in the device list is checked.  
  Demo:
  ```bash
  ./get-ip.sh foobar device-list lease-list
  ```
  - _TODO: check all listed devices and return first device with lease or exit with 1_
- When no device is given as argument, the first device is checked.  
  Demo:
  ```bash
  ./get-ip.sh "" device-list lease-list
  ```
  - _TODO: check all listed devices and return first device with lease or exit with 1_

## think it over?
- When a device doesn't have a lease, the script exits with 1.  
  Demo:
  ```bash
  ./get-ip.sh bar device-list lease-list
  ```
- When a device is not listed, the script exits with 1.  
  Demo:
  ```bash
  ./get-ip.sh notlisted device-list lease-list
  ```
