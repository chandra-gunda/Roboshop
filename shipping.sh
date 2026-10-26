dnf install maven -y

cp shipping.service /etc/systemd/system/shipping.service

useradd roboshop
mkdir /app
curl -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping-v3.zip
cd /app
unzip /tmp/shipping.zip
cd /app
mvn clean package
mv target/shipping-1.0.jar shipping.jar 

## For this application to work fully functional we need to load schema to the Database.To load schema we need to install mysql client.

dnf install mysql -y
mysql -h mysql-dev.gscdevops.in -uroot -pRoboShop@1 < /app/schema/shipping-schema.sql 
mysql -h mysql-dev.gscdevops.in -uroot -pRoboShop@1 < /app/schema/app-userdata.sql
mysql -h mysql-dev.gscdevops.in -uroot -pRoboShop@1 < /app/schema/master-data.sql

systemctl daemon-reload
systemctl enable shipping
systemctl start shipping

