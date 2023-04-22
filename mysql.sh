
real_path=$(realpath "$0")
echo $real_path
script_Path=$(dirname "$real_path")
echo $script_Path
dnf module disable mysql -y
echo sql installed
sudo cp $script_Path/mysql.repo /etc/nginx/default.d/
echo file copied
yum install mysql-community-server -y
echo mysql installed
systemctl enable mysqld
systemctl start mysql
echo services started
mysql_secure_installation --set-root-pass RoboShop@1
hange the default root password i
mysql -uroot -pRoboShop@1
completed