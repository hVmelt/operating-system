
#!/usr/bin/env bash
# class_lab.sh
# Operating Systems – Bash Commands Lab
# Name: Sarwat
# Course: Operating Systems

########################################
# Processes & Daemons
########################################

# List all running nginx processes
ps aux | grep nginx

# Kill all processes named my_script.sh
pkill -f my_script.sh

# Run backup.sh in background and survive logout
nohup ./backup.sh &

# Get PID of sshd
pidof sshd

# View process hierarchy
pstree -p

# List open files for PID 1234
lsof -p 1234

# Check docker daemon status
systemctl status docker

# Run heavy_calc.sh with lowest priority
nice -n 19 ./heavy_calc.sh


########################################
# Files, Copying & Archiving
########################################

cp -r /var/www/html /backup/html
cp -a secret.key /tmp/
rsync -av --ignore-existing src/ dest/
cp -u dir1/* dir2/
scp app.conf user@192.168.1.50:/etc/
tar -czvf logs.tar.gz /var/log


########################################
# find Command
########################################

find /home -type f -size +500M
find /var/log -type f -mtime -7
find /tmp -user jenkins
find /data -type d -empty -delete
find . -type f -perm 777
find . -name "*.jpg" -exec cp {} /images/ \;


########################################
# Regex (grep / sed)
########################################

grep -E -o '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}' contacts.txt
grep -i "error" syslog
grep '^root' config.ini
grep -v '192.168.1.1' access.log
grep -R "TODO" .
sed -i 's/localhost/127.0.0.1/g' hosts.txt
grep -v '^#' config.conf
grep -E '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' file.txt


########################################
# Complex Combinations
########################################

ps aux | grep '^root'
find . -name "*.log" -exec grep -l "Critical" {} \;
