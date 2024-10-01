script_path=$(dirname $0)
source ${script_path}/common.sh

echo -e "\e[36m>>>>>>>>>> configuring NodeJS repos <<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[36m>>>>>>>>>> install NodeJS <<<<<<<<\e[0m"
yum install nodejs -y

echo -e "\e[36m>>>>>>>>>> Add Application User <<<<<<<<\e[0m"
useradd ${app_user}

echo -e "\e[36m>>>>>>>>>> Create Application Directory <<<<<<<<\e[0m"
mkdir /app

echo -e "\e[36m>>>>>>>>>> Download App Content <<<<<<<<\e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
rm -rf /app
cd /app

echo -e "\e[36m>>>>>>>>>> Unzip App content <<<<<<<<\e[0m"
unzip /tmp/user.zip

echo -e "\e[36m>>>>>>>>>> install NodeJS Dependencies <<<<<<<<\e[0m"
npm install

echo -e "\e[36m>>>>>>>>>> Create Application Directory <<<<<<<<\e[0m"
cp ${script_path}/user.service /etc/systemd/system/user.service


echo -e "\e[36m>>>>>>>>>> start user service  <<<<<<<<\e[0m"
systemctl daemon-reload
systemctl enable user
systemctl restart user

