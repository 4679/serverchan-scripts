#!/bin/bash
key="这里填写你的key"

weatherinfo=$(curl -s "http://api.map.baidu.com/telematics/v3/weather?location=%E6%9C%9B%E5%9F%8E&output=json&ak=6dd11fd43e63dde2abc6bc9564aa37b3")
weather_today=$(echo $weatherinfo | jq .results | jq '.[].weather_data' | jq '.[0]')
city=$(echo $weatherinfo | jq .results | jq '.[].currentCity') && city=$(echo ${city#\"}) && city=$(echo ${city%\"})

day_pic=$(echo $weather_today | jq .dayPictureUrl) && day_pic=$(echo ${day_pic#\"}) && day_pic=$(echo ${day_pic%\"})
night_pic=$(echo $weather_today | jq .nightPictureUrl) && night_pic=$(echo ${night_pic#\"}) && night_pic=$(echo ${night_pic%\"})
weather=$(echo $weather_today | jq .weather) && weather=$(echo ${weather#\"}) && weather=$(echo ${weather%\"})
wind=$(echo $weather_today | jq .wind) && wind=$(echo ${wind#\"}) && wind=$(echo ${wind%\"})
temp=$(echo $weather_today | jq .temperature) && temp=$(echo ${temp#\"}) && temp=$(echo ${temp%\"})

title="Server醬"
content="变态 今天$city的天气是:$weather 气温$temp $wind


![day]($day_pic)
![night]($night_pic)


才 才不是特意提醒你的呢 哼~


![face](https://dn-4679kun.qbox.me/691875be0ff27db2.png)"

echo "[$(date)]" >> $HOME/weather.log
curl -s "http://sc.ftqq.com/$key.send?text=$title" -d "&desp=$content" >> $HOME/weather.log
echo -e "\n" >> $HOME/weather.log
