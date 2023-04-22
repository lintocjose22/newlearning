
real_path=$(realpath "$0")
echo $real_path
script_Path=$(dirname "$real_path")
dnf module disable mysql -y
sudo cp $script_Path/mysql.repo /etc/nginx/default.d/
yum install mysql-community-server -y
systemctl enable mysqld
systemctl start mysql
mysql_secure_installation --set-root-pass RoboShop@1
mysql -uroot -pRoboShop@1