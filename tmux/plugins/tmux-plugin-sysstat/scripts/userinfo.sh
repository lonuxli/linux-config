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

getvm(){
	local vms
	local disconnect=0
	local lines
	local i

	readarray -t lines < <(ps ux | grep qemu- | grep -v grep)
	vms=${#lines[@]}
		for (( i=0; i<$vms; i++))
		do
			ip=`echo ${lines[i]} | awk -F "IP=" '{print $2}' | awk -F " " '{print $1}'`
			ping ${ip} -c 1 -W 1 > /dev/null
			if [ $? != 0 ] ;then
				disconnect="$(( $disconnect + 1 ))"
			fi
		done

		if [ $disconnect == 0 ] ;then
			echo "VM:#[fg=green]${vms}#[default]"
		else
			echo "VM:#[fg=red]$disconnect#[default]/#[fg=green]${vms}#[default]"
		fi
	}

main(){
	local mailinfo=
	mailinfo="MAIL $mailinfo $(getmail "tome")"
	local vms=`ps ux | grep qemu | grep -v grep | wc -l`
	local vminfo="$(getvm)"
	echo $vminfo "|" $mailinfo
}

main
