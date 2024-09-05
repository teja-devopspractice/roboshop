echo -e "\e[36m>>>>>>>>>> Configure yum repos <<<<<<<<\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash

echo -e "\e[36m>>>>>>>>>> Configure RabbitMQ repos <<<<<<<<\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash

echo -e "\e[36m>>>>>>>>>> Install RabbitMQ  <<<<<<<<\e[0m"
dnf install rabbitmq-server -y

echo -e "\e[36m>>>>>>>>>> Start RabbitMQ  <<<<<<<<\e[0m"
systemctl enable rabbitmq-server
systemctl start rabbitmq-server

echo -e "\e[36m>>>>>>>>>> Add Application User <<<<<<<<\e[0m"
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
