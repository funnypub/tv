#!/data/data/com.termux/files/usr/bin/bash

curl --proxy http://192.168.0.111:10811 https://raw.githubusercontent.com/Kimentanm/aptv/master/m3u/iptv.m3u>/data/data/com.termux/files/home/fixtv/aptv.m3u

curl --proxy http://192.168.0.111:10811 https://raw.githubusercontent.com/YueChan/Live/main/IPTV.m3u>/data/data/com.termux/files/home/fixtv/iptv.m3u

curl --proxy http://192.168.0.111:10811 https://raw.githubusercontent.com/YueChan/Live/main/Radio.m3u>/data/data/com.termux/files/home/fixtv/Radio.m3u

curl --proxy http://192.168.0.111:10811 https://raw.githubusercontent.com/fanmingming/live/main/tv/m3u/itv.m3u>/data/data/com.termux/files/home/fixtv/fmmitv.m3u

curl --proxy http://192.168.0.111:10811 https://raw.githubusercontent.com/fanmingming/live/main/tv/m3u/ipv6.m3u>/data/data/com.termux/files/home/fixtv/fmmipv6.m3u

curl --proxy http://192.168.0.111:10811 https://raw.githubusercontent.com/Rivens7/Livelist/main/IPTV.m3u>/data/data/com.termux/files/home/fixtv/rivens7iptv.m3u

curl --proxy http://192.168.0.111:10811 https://epg.v1.mk/fy.xml>/data/data/com.termux/files/home/fixtv/fy.xml



cd /data/data/com.termux/files/home/fixtv/

java -jar fixtv-arm.jar aptv

java -jar fixtv-arm.jar iptv



rm -rf ./aptv_ori.txt

cat ./extra.txt ./aptv.txt > ./aptv_extra.txt

mv ./aptv.txt ./aptv_ori.txt

mv ./aptv_extra.txt ./aptv.txt



rm -rf ./iptv_ori.txt

cat ./extra.txt ./iptv.txt > ./iptv_extra.txt

mv ./iptv.txt ./iptv_ori.txt

mv ./iptv_extra.txt ./iptv.txt



rm -rf iptv_ori.m3u

cat ./iptv.m3u ./myyqk.m3u > ./iptv_extra.m3u

mv ./iptv.m3u ./iptv_ori.m3u

mv ./iptv_extra.m3u ./iptv.m3u



rm -rf aptv_ori.m3u

cat ./aptv.m3u ./myyqk.m3u > ./aptv_extra.m3u

mv ./aptv.m3u ./aptv_ori.m3u

mv ./aptv_extra.m3u ./aptv.m3u



git add *

git status

git commit -m "upgrade"

git push origin HEAD





