cp mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-org -y
### edit the file and replace 127.0.0.1 with 0.0.0.0

systemctl enable mongod
systemctl start mongod
