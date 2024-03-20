## Motivación

Estas son varias herramientas que he ido desarrollando a medida que he encontrado alguna dificultad con la gestión de servidores DHCP.

## Herramientas de alta y baja de MAC para gestionar nuevos equipos

### Manual de instrucciones para uso común de las herramientas

1. Ejecución del script de alta_MAC.sh <pcname> <mac> para crear una entrada de host.
2. Ejecución del script de baja_MAC.sh <pcname> para eliminar una entrada de host.

### Forma de uso en una situación real sería la siguiente:

root@servidor:~$./alta_MAC.sh pcX XX:XX:XX:XX:XX:XX // Creación de entrada
root@servidor:~$./baja_MAC.sh pcX // Eliminación de entrada

## Herramientas de Backup y Comparsion para ver los cambios de forma gráfica

### Manual de instrucciones para cambios de equipos en el servidor

1. Primero ejecutaremos el script backup.sh, el cual guardará una copia en la carpeta /etc/dhcp/backups, podremos distinguirla por fecha de creación haciendo un ls -l.
2. Tras haber hecho la cópia, podemos proceder a hacer cambios en el documento original dhcpd.*.conf.
3. En caso de haber errores o que el cambio de IP / MAC address sea incorrecto, ejecutamos el script compare.sh SIN SUDO y nos abrira Meld con ambos documentos, uno a cada lado, resaltando los cambios.

### La forma de uso en situación real sería la siguiente:
<pre lan="console">usuario@pcusuario:~$ ssh -X [user]@[IP/DNS.Name]
usuario@servidor:~$ cd /etc/dhcp3/
usuario@servidor:/etc/dhcp3$ sudo ./backup.sh // Seleccionas el fichero a guardar
usuario@servidor:/etc/dhcp3$ ./compare.sh // Importante usar sin sudo </pre>
