#!/bin/bash

main () {
    local device_list_file="$(dirname "${BASH_SOURCE[0]}")/device-list"
    local device="$1"

    local device_mac="$(tail -n +2 "${device_list_file}" | grep -i "${device}" | awk '{print $1}')"
    [ -n "${device_mac}" ] || exit 1
  
    local lease_list="$(dhcp-lease-list --last --parsable --lease lease-example 2>/dev/null)"
    [ -n "${lease_list}" ] || exit 1
  
    local device_ip="$(echo "${lease_list}" | grep ${device_mac} | awk '{print $4}')"
    [ -n "${device_ip}" ] && echo "${device_ip}" || exit 1
}

main "$@"
