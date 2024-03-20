#!/bin/bash

# Params
# mirar una mejor forma de pasar los parametros
pcname="$1"
mac_address="$2"

# Inventory function

inventory() {
    echo "host $pcname {
  hardware ethernet $mac_address
}" | tee -a /etc/dhcp/dhcpd.conf >/dev/null
}

# Script body

if [[ $mac_address =~ ^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$ ]]; then
    logger "[OK] MAC address has been validated as correct format."
    if grep -q "$mac_address" /etc/dhcp/dhcpd.conf || grep -q "$pcname" /etc/dhcp/dhcpd.conf; then
        logger "[FAIL] MAC address is already inventoried."
    else
        logger "[OK] MAC address not found in inventory."
        inventory
        logger "[OK] MAC address has been inventoried successfully."
    fi
else
    logger "[FAIL] MAC address has been validated as incorrect format."
fi
