APP_PREQUEST (){
    cp ${component}.service /etc/systemd/system/${component}.service

useradd roboshop

mkdir /app
curl -O /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip 
cd /app 
unzip /tmp/${component}.zip
cd /app

}
NODEJS (){
    dnf module disable nodejs -y
    dnf module enable nodejs:20 -y
    dnf install nodejs -y
APP_PREQUEST
 npm install
 SYSTEMD

}

PYTHON (){
    dnf install python36 gcc python3-devel -y

    APP_PREQUEST
    pip3 install --upgrade pip
    pip3 install -r requirements.txt
    SYSTEMD
}

SYSTEMD (){
    systemctl daemon-reload
    systemctl enable ${component}
    systemctl start ${component}
}
