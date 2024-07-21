## 1 SCRIPT = easy SSL for domain with Let's Encrypt

## LINUX ONLY | NGINX

## Manual | Hướng dẫn sử dụng:

#### NOTE: 
###### MAKE SURE YOUR DOMAIN RESOLVED TO YOUR SERVER'S IP ADDRESS (EX: USING "A" RECORD) BEFORE USING BELOW SCRIPT
###### (vietnamese) NHỚ TRỎ DOMAIN TỚI IP CỦA SERVER TRƯỚC KHI DÙNG LỆNH DƯỚI ĐÂY (Ví dụ: tạo "A" record trong cài đặt DNS)

## Step 1: 
##### Paste below command into terminal (Copy paste lệnh dưới vào thẳng terminal)
```
bash <(curl -s -L https://raw.githubusercontent.com/solomonerous/easySSL/main/domainSSL.sh)
```
## Step 2:
##### Just enter the domain name as prompted. | Nhập tên miền

#### Note: Certificate files are saved at `/home/ssl/<domain>/`
#### Note (vi): File chứng chỉ lưu tại đường dẫn `/home/ssl/<tên_domain>/`
