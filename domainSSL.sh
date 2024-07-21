#!/bin/sh
echo '[RUNNING]: "Script 1 lệnh có ngay SSL"'
read -p "Nhập tên miền (domain name) :" domain && cd /tmp
if [ ! -f "domainSSL_linux_amd64.tar.gz" ]; then
  wget https://github.com/solomonerous/easySSL/raw/main/domainSSL_linux_amd64.tar.gz
fi
tar zxvf domainSSL_linux_amd64.tar.gz
chmod 755 *
service nginx stop
./lego --email="admin@$domain" --domains="$domain" --http -a run
service nginx start
if ls ./.lego/certificates | grep "$domain"
    then
    mkdir -p /home/ssl/$domain
    cp ./.lego/certificates/$domain.crt /home/ssl/$domain/cert.pem
    cp ./.lego/certificates/$domain.key /home/ssl/$domain/key.pem
    path1="/home/ssl/$domain/cert.pem"
    path2="/home/ssl/$domain/key.pem"
    echo "'Get SSL cho domain thành công !'
        'Cert lưu tại đường dẫn: '$path1'.'
        'Key lưu tại đường dẫn: '$path2'.'"
else
    echo " 
        [ERROR]: GET SSL FAILED !
        [DEBUG]: 
        3 STEPs:
        1. Kiểm tra lại tên miền đã điền chính xác hay chưa .
        2. Hãy kiểm tra lại port 80 có bận không, kiểm tra bằng lệnh dưới đây
        ' lsof -i :80 '
        Dùng lệnh "kill [PID của tiến trình]" để tắt tiến trình đang chạy tại cổng 80 rồi chạy lại script này.
        3. Cấu hình phân giải tên miền (DNS) lỗi, kiểm tra lại cấu hình DNS.
        "
fi
echo ' # Credit: @solomonerous | MINH '
