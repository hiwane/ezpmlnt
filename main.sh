#!/bin/sh

set -e
find . | grep '\.[cp][th]p$' | xargs ./html5.sh
find . | grep '\.[cp][th]p$' | xargs ./hreftgt.sh
