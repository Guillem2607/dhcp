#!/bin/bash

# Parámetros
# Mira una mejor forma de pasar los parámetros
pcname="$1"
mac_address="$2"

# Función para eliminar del inventario

delete_from_inventory() {
    # Utiliza grep para buscar el host en el archivo dhcpd.conf
    if grep -q "host $pcname" /etc/dhcp/dhcpd.conf; then
        sed -i "/^host $pcname {$/,/^}$/d" /etc/dhcp/dhcpd.conf
    fi
}

# Cuerpo del script

if grep -q "$mac_address" /etc/dhcp/dhcpd.conf && grep -q "$pcname" /etc/dhcp/dhcpd.conf; then
    delete_from_inventory
    logger "[OK] Host $pcname has been successfully removed."
else
    logger "[FAIL] Host $pcname does not exist."
fi
