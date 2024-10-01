script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

echo -e "\e[36m>>>>>>>>>> Install Maven<<<<<<<<\e[0m"
yum install maven -y

echo -e "\e[36m>>>>>>>>>> Add Application User<<<<<<<<\e[0m"
useradd ${app_user}

echo -e "\e[36m>>>>>>>>>> Create Application Directory<<<<<<<<\e[0m"
rm -rf /app
mkdir /app

echo -e "\e[36m>>>>>>>>>> Download App Content <<<<<<<<\e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip


echo -e "\e[36m>>>>>>>>>> Unzip App content <<<<<<<<\e[0m"
cd /app
unzip /tmp/shipping.zip

echo -e "\e[36m>>>>>>>>>> Execute Maven Goals <<<<<<<<\e[0m"
mvn clean package
mv target/shipping-1.0.jar shipping.jar

echo -e "\e[36m>>>>>>>>>> Setup SystemD service <<<<<<<<\e[0m"
cp ${script_path}/shipping.service /etc/systemd/system/shipping.service

echo -e "\e[36m>>>>>>>>>> Install Mysql <<<<<<<<\e[0m"
dnf install mysql -y

echo -e "\e[36m>>>>>>>>>> Load Schema<<<<<<<<\e[0m"
mysql -h mysql-dev.raviteja.shop -uroot -pRoboShop@1 < /app/schema/shipping.sql

echo -e "\e[36m>>>>>>>>>> start shipping <<<<<<<<\e[0m"
systemctl daemon-reload
systemctl enable shipping
systemctl restart shipping
