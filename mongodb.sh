cp mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-org -y
### we have to change some settings
systemctl enable mongod
systemctl start mongod
