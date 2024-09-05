echo -e "\e[36m>>>>>>>>>> Install nginx <<<<<<<<\e[0m"
yum install nginx -y

echo -e "\e[36m>>>>>>>>>> Setup SystemD Service <<<<<<<<\e[0m"
cp roboshop.conf /etc/nginx/default.d/roboshop.conf
rm -rf /usr/share/nginx/html/*

echo -e "\e[36m>>>>>>>>>> Download App Content<<<<<<<<\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html

echo -e "\e[36m>>>>>>>>>> Extract <<<<<<<<\e[0m"
unzip /tmp/frontend.zip

echo -e "\e[36m>>>>>>>>>> Start nginx <<<<<<<<\e[0m"
systemctl enable nginx
systemctl restart nginx


