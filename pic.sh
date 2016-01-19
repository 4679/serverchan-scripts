#!/bin/bash
key="这里填写你的key"

result=$(curl -s "http://gank.avosapps.com/api/random/data/%E7%A6%8F%E5%88%A9/1")
result=$(echo $result | jq .results) && result=$(echo ${result#\[}) && result=$(echo ${result%\]})

url=$(echo $result | jq .url)
url=$(echo ${url#\"}) && url=$(echo ${url%\"})

time=$(date +%H:%M)
title="Server醬"
content="随机妹子图 $time


![pic]($url)"

echo "[$(date)]" >> $HOME/pic.log
echo $url >> $HOME/pic.log
curl -s "http://sc.ftqq.com/$key.send?text=$title" -d "&desp=$content" >> $HOME/pic.log
echo -e "\n" >> $HOME/pic.log
