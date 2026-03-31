#!/bin/bash

# Ensure log directory exists
mkdir -p /logs

FREE=$(df --block-size=1 /backup | awk 'NR==2 {print $4}')

if [ $FREE -lt 1000000000 ]; 
  then
      echo "Not enough space for date: $(date +%F)" >> /logs/backup.log
  else
      mkdir -p /backup/$(date +%F)
      cp -r /data/. /backup/$(date +%F)/
      echo "Backup successful for date: $(date +%F)" >> /logs/backup.log
fi
