# Synlab

- Docker compose templates 
- Example config files
- Other related scripts

### To install Gluetun kernel module

```
sudo insmod /lib/modules/tun.ko
```
Needed on reboot (Set via Task Scheduler).

### To enable Docker API


```
file=/var/packages/ContainerManager/etc/dockerd.json

data="{"data-root":"/var/packages/ContainerManager/var/docker","log-driver":"db","registry-mirrors":[],"storage-driver":"btrfs","hosts": ["tcp://0.0.0.0:2375", "unix:///var/run/docker.sock"]}"

echo $data > $file
````

### Some of the compose templates rely on an existing docket network:

```
docker network create my-default
```