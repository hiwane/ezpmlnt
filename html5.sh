#!/bin/sh
####################################################################
# HTML5 で廃止・非推奨となったタグを使用していないかを調べる
####################################################################

usage()
{
	if [ $# -ne 0 ]
	then
		echo "$@" >& 2
	fi


	cat <<- EOF 1>&2
	Usage $0 [-h][-c comment][-H]
	    -h: print this message
		-c: comment pattern (default: 's|//.*||')
EOF
}

OPT=
OPTION="-i"
COMMENT='s|//.*||'
PATTERN="<\(font\|dir\|tt\)[ >]"
while getopts Hc: OPT
do
	case $OPT in
	H) OPTION="${OPTION} -${OPT}" ;;
	c) COMMENT="$OPT" ;;
	h)
		usage
		exit 1;;
	\?)
		usage "invalid option"
		exit 1 ;;
	esac
done
shift `expr $OPTIND - 1`

if [ $# -eq 0 ]; then
	usage "no target files"
	exit 1
fi

if grep ${OPTION} "${PATTERN}" "$@" | sed "${COMMENT}" | grep ${OPTION} "${PATTERN}"; then
	exit 1
fi
exit 0

# EOF

