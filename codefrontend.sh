yum install nginx -y
systemctl enable nginx
systemctl start nginx
rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
sudo cp roboshop.conf /etc/nginx/default.d/
sed -i -e 's|/catalogue/ { proxy_pass http://localhost:|/catalogue/ { proxy_pass http://frontend.lintocjose.online:|' /etc/nginx/default.d/roboshop.conf
systemctl restart nginx