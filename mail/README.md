# mutt+msmtp+getmail+procmail邮箱配置

## 建立配置软链接
ln -s ~/github/linux-config/mail ~/.mailconfig  
ln -s ~/.mailconfig/muttrc ~/.muttrc  
ln -s ~/.mailconfig/msmtprc ~/.msmtprc   
chmod 0600 ~/.msmtprc  
ln -s ~/.mailconfig/procmailrc  ~/.procmailrc  

## 创建目录及文件
mkdir ~/.Mail  
mkdir -p ~/.Mail/inbox  
mkdir -p ~/.Mail/inbox/new  
mkdir -p ~/.Mail/inbox/cur  
mkdir -p ~/.Mail/inbox/tmp  
mkdir -p ~/.Mail/outbox  
mkdir -p ~/.Mail/outbox/new  
mkdir -p ~/.Mail/outbox/cur  
mkdir -p ~/.Mail/outbox/tmp  
mkdir -p ~/.Mail/lkml  
mkdir -p ~/.Mail/lkml/new  
mkdir -p ~/.Mail/lkml/cur  
mkdir -p ~/.Mail/lkml/tmp  
mkdir -p ~/.Mail/drafts  
mkdir -p ~/.Mail/drafts/new  
mkdir -p ~/.Mail/drafts/cur  
mkdir -p ~/.Mail/drafts/tmp  

mkdir -p ~/.Mail/.mutt  
touch ~/.Mail/.mutt/mutt.alias  

mkdir ~/log  
mkdir -p ~/log/mail  
touch ~/log/mail/procmail.log  
touch ~/log/mail/msmtp.log  
touch ~/log/mail/crontab.log

mkdir ~/incoming  

## 支持256色
echo "TERM=xterm-256color" >> ~/.bashrc  


## 支持定时收取邮件
运行命令crontab -e设置下列参数启动定时脚本
*/5     *       *       *       *       ~/.mailconfig/mailbin/getmail.sh >> ~/log/mail/crontab.log
