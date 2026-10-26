dnf module disable redis -y
dnf module enable redis:7.0 -y
dnf install redis -y
sed -i -e 's|127.0.0.1|0.0.0.0|'  -e 's|protected-mode yes|protected-mode no|' /etc/redis.conf
systemctl enable redis
systemctl restart redis