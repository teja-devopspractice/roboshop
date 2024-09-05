echo -e "\e[36m>>>>>>>>>> Copy Mongo.repo <<<<<<<<\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[36m>>>>>>>>>> Install MongoDB <<<<<<<<\e[0m"
yum install mongodb-org -y

echo -e "\e[36m>>>>>>>>>> Change Listener Address <<<<<<<<\e[0m"
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/mongod.conf

echo -e "\e[36m>>>>>>>>>> Start MongoDB <<<<<<<<\e[0m"
systemctl enable mongod
systemctl restart mongod
