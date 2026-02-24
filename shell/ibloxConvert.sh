#!/bin/bash
cdr2mask ()
{
  set -- $(( 5 - ($1 / 8) )) 255 255 255 255 $(( (255 << (8 - ($1 % 8))) & 255 )) 0 0 0
  [ $1 -gt 1 ] && shift $1 || shift
  echo ${1-0}.${2-0}.${3-0}.${4-0}
}
cdr2mask 8
echo foo

INPUT=subs.csv
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read subnet cidr
do
  echo "$subnet"
  cdr2mask "$cidr"
done < $INPUT
IFS=$OLDIFS
