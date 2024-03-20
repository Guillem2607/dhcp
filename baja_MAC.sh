#!/bin/bash

# Parámetros
# Mira una mejor forma de pasar los parámetros
pcname="$1"
mac_address="$2"

# Función para eliminar del inventario

delete_from_inventory() {
    sed -i "/^host $pcname {$/,/^}$/d" /etc/dhcp/dhcpd.conf
}

# Cuerpo del script

if grep -q "$pcname" /etc/dhcp/dhcpd.conf; then
    delete_from_inventory
    logger "[OK] MAC Address hac been deleted from the inventory"
else

fi
