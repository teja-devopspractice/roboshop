echo -e "\e[35m>>>>>>>>>>Install Redis Repos<<<<<<<<\e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
echo -e "\e[35m>>>>>>>>>>Installing Redis<<<<<<<<\e[0m"
dnf module enable redis:remi-6.2 -y
dnf install redis -y
echo -e "\e[35m>>>>>>>>>>Update listen address<<<<<<<<\e[0m"
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/redis.conf
echo -e "\e[35m>>>>>>>>>>Start Redis service<<<<<<<<\e[0m"
systemctl enable redis
systemctl start redis