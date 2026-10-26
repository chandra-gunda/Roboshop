dnf install golang -y
useradd roboshop
mkdir /app
curl -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch-v3.zip
cd /app
unzip /tmp/dispatch.zip 
## Lets download the dependencies & build the software.
go mod init dispatch
go get
go build

systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch