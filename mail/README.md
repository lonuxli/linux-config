# mutt+msmtp+getmail+procmail邮箱配置

## 建立配置软链接
ln -s ~/github/linux-config/mail/muttrc ~/.muttrc  
ln -s ~/github/linux-config/mail/msmtprc ~/.msmtprc 
ln -s ~/github/linux-config/mail/procmailrc  ~/.procmailrc  

## 创建邮件及地址博目录
mkdir ~/.Mail  
mkdir -p ~/.Mail/inbox  
mkdir -p ~/.Mail/outbox  
mkdir -p ~/.Mail/inbox/new  
mkdir -p ~/.Mail/inbox/cur  
mkdir -p ~/.Mail/inbox/tmp  
mkdir -p ~/.Mail/LKML  
mkdir -p ~/.Mail/LKML/new  
mkdir -p ~/.Mail/LKML/cur  
mkdir -p ~/.Mail/LKML/tmp  
mkdir -p ~/.Mail/.mutt  
touch ~/.Mail/.mutt/mutt.alias  

## 支持256色
echo "TERM=xterm-256color" >> ~/.bashrc  
echo "set t_Co=256" >> ~/.vimrc  

