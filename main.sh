#!/bin/sh

set -e
HERE=`which "$0"`
HERE=`dirname ${HERE}`
find . | grep '\.[cp][th]p$' | xargs ${HERE}/html5.sh
find . | grep '\.[cp][th]p$' | xargs ${HERE}/hreftgt.sh
