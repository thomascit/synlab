#!/bin/sh

file=/var/packages/ContainerManager/etc/dockerd.json
data="{"data-root":"/var/packages/ContainerManager/var/docker","log-driver":"db","registry-mirrors":[],"storage-driver":"btrfs","hosts": ["tcp://0.0.0.0:2375", "unix:///var/run/docker.sock"]}"
echo $data > $file