#!/bin/bash
#
#  Usage: chk_n_boot.sh PROCESSNAME
#

if [ -z $1 ]; then
	echo "Usage: $0 process"; exit 1
fi

process=$1

state=$(systemctl status $process | grep Active | awk '{ print $2 }')
if [ "$state" != active ]; then
	systemctl restart $process
fi

exit 0
