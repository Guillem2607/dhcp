## Maunual de instrucciones para cambios de equipos en el servidor

1. Primero ejecutaremos el script backup.sh, el cual guardará una copia en la carpeta ../backups, podremos distinguirla por fecha de creación haciendo un ls -l.
2. Tras haber hecho la cópia, podemos proceder a hacer cambios en el documento original dhcpd.*.conf.
3. En caso de haber errores o que el cambio de IP / MAC address sea incorrecto, ejecutamos el script compare.sh SIN SUDO y nos abrira Meld con ambos documentos, uno a cada lado, resaltando los cambios.

## La forma de uso en situación real sería la siguiente:
<pre lan="console">usuario@pcusuario:~$ ssh -X [user]@[IP/DNS.Name]
usuario@servidor:~$ cd /etc/dhcp3/
usuario@servidor:/etc/dhcp3$ sudo ./backup.sh //Seleccionas el fichero a guardar
usuario@servidor:/etc/dhcp3$ ./compare.sh // Importante usar sin sudo </pre>
