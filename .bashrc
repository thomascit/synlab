echo "--------------------------------------------------"
echo "Hostname: $(uname -n)"
echo "OS: Synology DSM $(get_key_value /etc.defaults/VERSION productversion) $(get_key_value /etc.defaults/VERSION buildnumber)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "CPU: $(cat /proc/cpuinfo | grep 'model name' | uniq | cut -d':' -f2)"
echo "RAM: $(free -m | awk '/Mem:/ {print $2}') MB"
echo "Storage: $(df -h | grep '/volume1' | awk '{print $2}') total"
echo "--------------------------------------------------"

export TERM=xterm-256color
