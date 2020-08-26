#!/bin/sh

usage()
{
	if [ $# -ne 0 ]
	then
		echo "$@" >& 2
	fi


	cat <<- EOF 1>&2
	Usage $0 [-h]
	    -h: print this message
EOF
}

OPT=
OPTION="-i"
while getopts Hh OPT
do
	case $OPT in
	h)
		usage
		exit 1;;
	\?)
		usage "invalid option"
		exit 1 ;;
	esac
done
shift `expr $OPTIND - 1`

RET=0
if grep -H ${OPTION} href= "$@" | grep targe | grep -v $OPTION -E '=._blank'; then
	RET=1
fi
if grep -H ${OPTION} href= "$@" | grep blank | grep -v $OPTION target=; then
	RET=1
fi

exit ${RET}

