# Synlab
- Docker compose templates 
- Example config files
- Other related scripts
<br>
<br>

### Allow Plex transcoding
Needed on reboot (Set via Task Scheduler)
```
chmod 666 /dev/dri/*
```

### To install Gluetun kernel module (Only if used)
Needed on reboot (Set via Task Scheduler)
```
sudo insmod /lib/modules/tun.ko
```
<br>
<br>

### To enable Docker API
```
file=/var/packages/ContainerManager/etc/dockerd.json

data="{"data-root":"/var/packages/ContainerManager/var/docker","log-driver":"db","registry-mirrors":[],"storage-driver":"btrfs","hosts": ["tcp://0.0.0.0:2375", "unix:///var/run/docker.sock"]}"

echo $data > $file
```
<br>
<br>

### Create docker network (needed for some templates):

```
docker network create my_default
```
<br>
<br>

### Discord webhook configuration for Synology

```
General Settings:
     HTTP Method = POST

HTTP Header:
     Content-Type = application/json

Add Header:
     content = -

HTTP Body:
{
  "content": "@@TEXT@@"
}
```
<br>
<br>

### Schedule

| App  | Schedule | Frequency |
| ------------- | ------------- | ------------- |
| Sabnzbd-Radarr | 12:00AM-4:00AM  | Monday, Wednesday, Saturday |
| Sabnzbd-Sonarr | 12:00AM-4:00AM  | Tuesday, Thursday, Friday, Sunday |
| Plex Maintenance  | 4:00AM-8:00AM  | Daily |
| Posterizarr  | 9:00AM  | Daily |
| Kometa  | 10:00AM  | Daily |
| Watchtower  | 12:00PM  | Sundays |

<br>
<br>

### Work-in-Progress
[monitoring]
- prometheus
- grafana
- snmp-exporter

[scripts]
- fix-editions