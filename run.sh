#!/bin/bash
set -e

if [ "$VERBOSE" -eq 1 ]; then
  VERBOSEFLAG='-v'
fi

# if webalizer.current does not exist, we assume an initial run and process all found logs
if [ ! -f /webalizer/webalizer.current ]; then
  for i in `ls -tr /logs/*`
  do 
    /usr/bin/webalizer ${VERBOSEFLAG} -n ${DOMAIN} -r ${DOMAIN} -c /etc/webalizer.conf -o /webalizer $i
  done
fi


while true
do
  /usr/bin/webalizer ${VERBOSEFLAG} -n ${DOMAIN} -r ${DOMAIN} -c /etc/webalizer.conf -o /webalizer /logs/*
  DATE=`date '+%Y-%m-%d %H:%M:%S'`
  echo "${DATE}: ALIVE! Sleeping for ${INTERVAL} seconds now"
  sleep ${INTERVAL}
done
