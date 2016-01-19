#!/bin/bash
key="这里填写你的key"

airinfo=$(curl -s "http://www.pm25.in/api/querys/aqis_by_station.json?token=5j1znBVAsnSf5xQyNQyq&station_code=1336A")
airinfo=$(echo ${airinfo#\[}) && airinfo=$(echo ${airinfo%\]})

aqi=$(echo $airinfo | jq .aqi)
station=$(echo $airinfo | jq .position_name)
quality=$(echo $airinfo | jq .quality)
pollutant=$(echo $airinfo | jq .primary_pollutant)

station=$(echo ${station#\"}) && station=$(echo ${station%\"})
quality=$(echo ${quality#\"}) && quality=$(echo ${quality%\"})
pollutant=$(echo ${pollutant#\"}) && pollutant=$(echo ${pollutant%\"})

title="Server醬"
content="变态 目前 由 $station 监测到的的空气质量指数是:$aqi 属于 $quality 主要污染物是 $pollutant


才 才不是特意提醒你的呢 哼~


![face](https://dn-4679kun.qbox.me/691875be0ff27db2.png)"

echo "[$(date)]" >> $HOME/aqi.log
curl -s "http://sc.ftqq.com/$key.send?text=$title" -d "&desp=$content" > $HOME/aqi.log
echo -e "\n" >> $HOME/aqi.log
