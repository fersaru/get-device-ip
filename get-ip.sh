#!/bin/bash

main () {
    local device_name="$1"

    local device_list_file="$2"
    [ -n "${device_list_file}" ] || exit 1

    local lease_file="${3:-}"

    local lease_addition=""
    [ -n "${lease_file}" ] && lease_addition="--lease ${lease_file}"

    local device_mac="$(tail -n +2 "${device_list_file}" | grep -m 1 -i "${device_name}" | awk '{print $1}')"
    [ -n "${device_mac}" ] || exit 1
  
    local lease_list="$(dhcp-lease-list --parsable ${lease_addition} 2>/dev/null)"
    [ -n "${lease_list}" ] || exit 1
  
    local device_ip="$(echo "${lease_list}" | grep ${device_mac} | awk '{print $4}')"
    [ -n "${device_ip}" ] && echo "${device_ip}" || exit 1
}

main "$@"
