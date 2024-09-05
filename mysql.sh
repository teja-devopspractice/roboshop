echo -e "\e[36m>>>>>>>>>> Disable default mysql <<<<<<<<\e[0m"
dnf module disable mysql -y

echo -e "\e[36m>>>>>>>>>> Copy Mysql repo file <<<<<<<<\e[0m"
cp /home/centos/roboshop/mysql.repo /etc/yum.repos.d/mysql.repo

echo -e "\e[36m>>>>>>>>>> Install Mysql <<<<<<<<\e[0m"
dnf install mysql-community-server -y

echo -e "\e[36m>>>>>>>>>> Start Mysql <<<<<<<<\e[0m"
systemctl enable mysqld
systemctl restart mysqld

echo -e "\e[36m>>>>>>>>>> Reset  Mysql Password <<<<<<<<\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1

