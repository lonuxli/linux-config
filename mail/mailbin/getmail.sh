#!/bin/bash

# 自动拉取邮件脚本，供cron定时调用
# 扫描配置目录下的getmailrc.*文件，每个文件对应一个邮箱账户
# 例如: getmailrc.gmail → 使用 getmailrc.gmail 拉取gmail邮件
# ~/.mailconfig/getmail/getmailrc.gmail

GETMAIL_DIR=$HOME/.mailconfig/getmail

# 使用代理时取消注释
#export http_proxy=socks5://127.0.0.1:1080
#export https_proxy=socks5://127.0.0.1:1080
#proxychains4 getmail -n --getmaildir="$GETMAIL_DIR" -r getmailrc.<account>

for getmailrc_file in "$GETMAIL_DIR"/getmailrc.*; do
	[ -f "$getmailrc_file" ] || continue

	account="${getmailrc_file##*.}"
	getmail_rc="$GETMAIL_DIR/getmailrc.$account"

	if [ -f "$getmail_rc" ]; then
		echo "getmail from $getmail_rc"
		getmail -n --getmaildir="$GETMAIL_DIR" -r "getmailrc.$account"
	else
		echo "Warning: found $getmailrc_file but no getmailrc.$account"
	fi
done
