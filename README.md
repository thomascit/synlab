# Synlab

- Docker compose templates 
- Example config files
- Other related scripts

### To install Gluetun kernel module (Only if used)

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

### Create docker network (needed for some templates):

```
docker network create my-default
```