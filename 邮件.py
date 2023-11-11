import os
import sys
import smtplib
import traceback
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication
from email.header import Header

paths = sys.argv[1:]

send_addr = 'mailname@126.com'
pass_word = 'password'
recv_addr = 'wai2nei@vip.163.com'
smtp_server = 'smtp.126.com'

subject = 'lishx1'
body = f'This email contain {len(paths)} attachments:\n' + ''.join(f'  "{p}"\n' for p in paths)
print(body)

msg = MIMEMultipart()
msg['Subject'] = Header(subject, 'utf-8')
msg['From'] = send_addr
msg['To'] = recv_addr
msg.attach(MIMEText(body, 'plain', 'utf-8'))

for path in paths:
    if os.path.exists(path):
        with open(path, 'rb') as f:
            attachment = MIMEApplication(f.read())
            attachment.add_header('Content-Disposition', 'attachment', filename=os.path.basename(path))
            msg.attach(attachment)

try:
    server = smtplib.SMTP_SSL(smtp_server, 465)
    server.login(send_addr, pass_word)
    server.sendmail(send_addr, recv_addr, msg.as_string())
    server.quit()
except Exception as e:
    traceback.print_exc(1)
    print()
else:
    print('Send success!\n')

os.system('pause')
