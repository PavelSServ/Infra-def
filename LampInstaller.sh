#!/bin/bash

echo "Starting to update"
sudo apt update

echo "Starting to install apache2"
sudo apt install apache2 -y

echo "=================="
echo "|    ufw list    |"
echo "=================="

sudo ufw app list

echo "============================="
echo "|    ufw allow in apache    |"
echo "============================="

sudo ufw allow in "Apache"

echo "===================="
echo "|    ufw status    |"
echo "===================="

sudo ufw status -y

echo "Press any key to install MySQL"
read -n 1

echo "===================="
echo "|       MySQL      |"
echo "===================="

sudo apt install mysql-server -y

echo "Press any key to install PHP"
read -n 1

echo "===================="
echo "|       PHP        |"
echo "===================="

sudo apt install php libapache2-mod-php php-mysql -y

echo "====================="
echo "|    PHP version    |"
echo "====================="
php -v

echo "Press any key to install MySQL"
read -n 1

echo "Create Virtual Host for Web"
sudo mkdir /var/www/testdomain
chown -R $USER:$USER /var/www/your_domain

apt install nano -y

echo "Config backup"

mkdir /etc/apache2/sites-available/backup
cp /etc/apache2/sites-available/*.conf /etc/apache2/sites-available/backup/

echo "Copy config"
cp  ./testconfig.conf /etc/apache2/sites-available/testdomain.conf

apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y

systemctl restart apache2

cp  ./testconfig.conf /etc/apache2/sites-available/wordpress.conf

a2enmod rewrite

apache2ctl configtest

systemctl restart apache2

cd /tmp

curl -O https://wordpress.org/latest.tar.gz

tar xzvf latest.tar.gz

touch /tmp/wordpress/.htaccess
cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php

mkdir /tmp/wordpress/wp-content/upgrade
sudo cp -a /tmp/wordpress/. /var/www/wordpress

sudo chown -R www-data:www-data /var/www/wordpress
sudo find /var/www/wordpress/ -type d -exec chmod 750 {} \;
sudo find /var/www/wordpress/ -type f -exec chmod 640 {} \;
curl -s https://api.wordpress.org/secret-key/1.1/salt/

echo "Test"

# hecker(){
#     RESPONSE_CODE=$(curl --write-out %{http_code} --silent --output /dev/null $1)
#     CODENUM=$2

#     if [ "$RESPONSE_CODE" != "$CODENUM" ]; then
#         echo "$LINE : $CODENUM"
#     fi
# }

# if [ -z $2 ];
# then
#     CODE=$2
# else
#     CODE=200
# fi

# while read LINE; do checker "$LINE" "$CODE"; done < $1


