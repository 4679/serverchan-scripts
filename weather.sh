#!/bin/bash
key="这里填写你的key"

weatherinfo=$(curl -s "http://www.weather.com.cn/adat/cityinfo/101250105.html" | jq .weatherinfo)
city=$(echo $weatherinfo | jq .city)
weather=$(echo $weatherinfo | jq .weather)
temp1=$(echo $weatherinfo | jq .temp1)
temp2=$(echo $weatherinfo | jq .temp2)

city=$(echo ${city#\"}) && city=$(echo ${city%\"})
weather=$(echo ${weather#\"}) && weather=$(echo ${weather%\"})
temp1=$(echo ${temp1#\"}) && temp1=$(echo ${temp1%\"})
temp2=$(echo ${temp2#\"}) && temp2=$(echo ${temp2%\"})

title="Server醬"
content="变态 今天$city的天气是:$weather 最高气温$temp1 最低气温$temp2 


才 才不是特意提醒你的呢 哼~


![face](https://dn-4679kun.qbox.me/691875be0ff27db2.png)"

echo "[$(date)]" >> $HOME/weather.log
curl -s "http://sc.ftqq.com/$key.send?text=$title" -d "&desp=$content" >> $HOME/weather.log
echo -e "\n" >> $HOME/weather.log
