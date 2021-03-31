# lamp-ubuntu18.04

A set of scripts for quickly launching the php 7. 4 apache mariadb git + cron + composer container.
to start the project, run

git clone https://github.com/SidorkinAlex/lamp-ubuntu18.04.git container_name

next, to manually configure the ports, run ManualRun.sh being in the project directory
```
./ManualRun.sh
```
to automatically create a container, use Run.sh
to launch a container from it, you must specify the ports in the files

http-port.txt
https-port.txt
ssh-port.txt
db-port.txt
if the file with the port is empty, the port is not forwarded.

There are also folders in the project:

lamp-apache-conf/ - Apache2 config files
lamp-mariadb/ Mariadb database files
lamp-mariadb-conf/ MARIADB database configuration files
lamp-docroot is created automatically when the container is created
this is the root directory of your project


Набор скриптов для быстрого запуска контейнера php7. 4 apache mariadb git + cron + composer.
для запуска проекта выполните 

git clone https://github.com/SidorkinAlex/lamp-ubuntu18.04.git container_name

далее для ручного конфигурирования портов запускаем ManualRun.sh находять в директории проекта 
```
./ManualRun.sh
```
для автоматического создания контейнера используется Run.sh
для запуска контейнера   из него необходимо указать порты в файлах

http-port.txt
https-port.txt
ssh-port.txt
db-port.txt
если файл с портом пустой то порт не пробрасывается.

Так же в проекте присутствуют папки:

lamp-apache-conf/ - файлы конфига Apache2
lamp-mariadb/ файлы базы данных Mariadb
lamp-mariadb-conf/ файлы конфигурации базы данных MARIADB
lamp-docroot создается автоматически при создании контейнера 
это корневая директория вашего проекта


