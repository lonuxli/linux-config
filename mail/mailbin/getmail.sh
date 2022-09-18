#!/bin/bash

# 使用代理时
#export http_proxy=socks5://127.0.0.1:1080
#export https_proxy=socks5://127.0.0.1:1080
proxychains4 getmail -n -r ~/.mailconfig/getmail/getmailrc.gmail

# 不使用代理时
getmail -n -r ~/.mailconfig/getmail/getmailrc.163

