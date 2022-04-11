#!/bin/bash
set -e
set -x

if [ -z ${1+x} ]; then
  echo "Missing parameter currency unit"
  exit 1
fi

./sandbox goal asset create --clawback CLF3ZXJJL3MAJAPOOAZS572U5RV3D6IGVS2EDYZVB5UYJ64Y7DSKEJX6IQ --creator CLF3ZXJJL3MAJAPOOAZS572U5RV3D6IGVS2EDYZVB5UYJ64Y7DSKEJX6IQ --decimals 0 --manager CLF3ZXJJL3MAJAPOOAZS572U5RV3D6IGVS2EDYZVB5UYJ64Y7DSKEJX6IQ --name $1 --unitname $1 --no-freezer --total 1000
ASSET_ID=`curl -s "http://localhost:8980/v2/assets?unit=${1}" | jq -r ".assets[0].index"`
./sandbox goal asset send -a 0   --assetid $ASSET_ID -f HD324QN6M6NOVPOT3APDFMM3DEA2QKOR7YIX6D5VBEIT7CVE6PUVNXIVO4 -t HD324QN6M6NOVPOT3APDFMM3DEA2QKOR7YIX6D5VBEIT7CVE6PUVNXIVO4
./sandbox goal asset send -a 0   --assetid $ASSET_ID -f ZMK56DJQYHNBYOXM36NEKP5VGSYFVVHPQEA7XJPUYQZQTA6JO2COB2T7XQ -t ZMK56DJQYHNBYOXM36NEKP5VGSYFVVHPQEA7XJPUYQZQTA6JO2COB2T7XQ
./sandbox goal asset send -a 100 --assetid $ASSET_ID -f CLF3ZXJJL3MAJAPOOAZS572U5RV3D6IGVS2EDYZVB5UYJ64Y7DSKEJX6IQ -t HD324QN6M6NOVPOT3APDFMM3DEA2QKOR7YIX6D5VBEIT7CVE6PUVNXIVO4
./sandbox goal asset send -a 10  --assetid $ASSET_ID -f HD324QN6M6NOVPOT3APDFMM3DEA2QKOR7YIX6D5VBEIT7CVE6PUVNXIVO4 -t CLF3ZXJJL3MAJAPOOAZS572U5RV3D6IGVS2EDYZVB5UYJ64Y7DSKEJX6IQ -c ZMK56DJQYHNBYOXM36NEKP5VGSYFVVHPQEA7XJPUYQZQTA6JO2COB2T7XQ
