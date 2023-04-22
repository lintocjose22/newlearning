
real_path=$(realpath "$0")
echo $real_path
script_Path=$(dirname "$real_path")
echo scriptpath is  $script_Path
#exit
source ${script_Path}/common.sh
dnf module disable mysql -y
echo sql installed
cp $script_Path/mysql.repo /etc/yum.repos.d

echo file copied
yum install mysql-community-server -y

echo mysql installed
#exit
systemctl enable mysqld
systemctl start mysqld
echo services started
mysql_secure_installation --set-root-pass RoboShop@1
hange the default root password i
mysql -uroot -pRoboShop@1
completed