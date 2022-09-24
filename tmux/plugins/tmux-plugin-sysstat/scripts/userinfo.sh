#!/usr/bin/env bash

set -u
set -e

MAILDIR=$HOME/.Mail
LC_NUMERIC=C

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

getmail(){
  
	MAILBOX=$1
	local cur=`ls ${MAILDIR}/${MAILBOX}/cur | wc -l`
	local new=`ls ${MAILDIR}/${MAILBOX}/new | wc -l`
	local total="$(( $new + $cur ))"

	echo "${MAILBOX}(#[fg=green]${new}#[default]/${total})"
}

main(){
	local mailinfo=
	mailinfo="$mailinfo $(getmail "tome")"
	mailinfo="$mailinfo $(getmail "lkml")"
	mailinfo="$mailinfo $(getmail "inbox")"
	local vms=`ps ux | grep qemu | grep -v grep | wc -l`
	local vminfo="VM(#[fg=green]${vms}#[default])"
	echo $mailinfo $vminfo
}

main
