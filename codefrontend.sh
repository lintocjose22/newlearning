echo scriptname -$0
echo first -$1
exit
real_path=$(realpath "$0")
echo $real_path
script_Path=$(dirname "$real_path")
echo scriptpath is  $script_Path
#exit
source ${script_Path}/common.sh
yum install nginx -y
systemctl enable nginx
systemctl start nginx
rm -rf /usr/share/nginx/html/*
#sudo cp $script_Path/roboshop.conf /etc/nginx/default.d/
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html
echo $pwd
unzip /tmp/frontend.zip
sudo cp $script_Path/roboshop.conf /etc/nginx/default.d/
useradd ${user_name}
sed -i -e 's|/catalogue/ { proxy_pass http://localhost:|/catalogue/ { proxy_pass http://frontend.lintocjose.online:|' /etc/nginx/default.d/roboshop.conf
systemctl restart nginx