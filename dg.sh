#!/usr/bin/bash

export DOMAIN=`echo $1 | sed -E 's/(https?:|\/)//g' `

export OUTPUT_NS=`dig ns $DOMAIN +short `
export OUTPUT_A=`dig a  $DOMAIN +short `
export OUTPUT_AW=`dig a  www.$DOMAIN +short `
export OUTPUT_MX=`dig mx $DOMAIN +short `
export OUTPUT_TX=`dig txt $DOMAIN +short `

echo "DOMAIN: $DOMAIN"

echo "$OUTPUT_NS" | while read NS_RECORD
do
echo "NS : " $NS_RECORD
done

echo "A  : " $OUTPUT_A

echo "AW : " $OUTPUT_AW

echo "$OUTPUT_MX" | while read MX_RECORD
do
echo "MX : " $MX_RECORD
done

echo "$OUTPUT_TX" | while read TXT_RECORD
do
echo "TXT: " $TXT_RECORD
done
