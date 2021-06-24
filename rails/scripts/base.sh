#!/bin/bash

clear;
echo -e "\033[36m 1. 创建并进入工作目录：mkdir /root/workspace && cd /root/workspace \033[0m";
if [ ! -d "/root/workspace" ];
  then mkdir /root/workspace && cd /root/workspace;
  else cd /root/workspace;
fi;

echo -e "\033[36m 2. 若 /etc/apt/sources.list.backups 已存在，就还原到 /etc/apt/sources.list \033[0m";
if [ -f "/etc/apt/sources.list.backups" ];
  then cp /etc/apt/sources.list.backups /etc/apt/sources.list;
fi;

echo -e "\033[36m 3. 正在备份 /etc/apt/sources.list 到 /etc/apt/sources.list.backups \033[0m";
cp /etc/apt/sources.list /etc/apt/sources.list.backups;

echo -e "\033[36m 4. 正在把阿里源写到 /etc/apt/sources.list 文件中 \033[0m";
cat > /etc/apt/sources.list << EOF
deb http://mirrors.aliyun.com/debian/ buster main non-free contrib
deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib
deb http://mirrors.aliyun.com/debian-security buster/updates main

deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib
deb-src http://mirrors.aliyun.com/debian-security buster/updates main
EOF

echo -e "\033[36m 5. 正在清除 apt-get 缓存: apt-get clean \033[0m" \
&& apt-get clean \
&& echo -e "\033[36m 6. 正在更新 /etc/apt/sources.list 源的索引: apt-get update \033[0m" \
&& apt-get update \
&& echo -e "\033[36m 7. 正在升级已安装的所有软件包: apt-get upgrade -y \033[0m" \
&& apt-get upgrade -y \
&& echo -e "\033[36m 8. 正在安装 sqlite3: apt-get install -y sqlite3 \033[0m" \
&& apt-get install -y sqlite3 \
&& echo -e "\033[36m 9. 正在安装 nodejs: apt-get install -y nodejs \033[0m" \
&& apt-get install -y nodejs \
&& echo -e "\033[36m 10. 正在安装 npm: apt-get install -y npm \033[0m" \
&& apt-get install -y npm \
&& echo -e "\033[36m 11 .正在设置 npm taobao 源: npm config set registry https://registry.npm.taobao.org/ \033[0m" \
&& npm config set registry https://registry.npm.taobao.org/ \
&& echo -e "\033[36m 12. 正在清除 npm 缓存: npm cache clean -f \033[0m" \
&& npm cache clean -f \
&& echo -e "\033[36m 13. 正在安装 n: npm install n -g \033[0m" \
&& npm install n -g \
&& echo -e "\033[36m 14. 正在升级 nodejs 到最新稳定版：n stable \033[0m" \
&& PATH="$PATH" && n stable \
&& echo -e "\033[36m 15. 正在安装 yarn：npm install -g yarn \033[0m" \
&& npm install -g yarn \
&& echo -e "\033[36m 16. 正在设置 yarn taobao 源: yarn config set registry https://registry.npm.taobao.org/ \033[0m" \
&& yarn config set registry https://registry.npm.taobao.org/ \
&& echo -e "\033[36m 17. 正在更换 gem 默认源: gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/ \033[0m" \
&& gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/ \
&& echo -e "\033[36m 18. 正在更换 bundler 默认源: bundle config mirror.https://rubygems.org https://gems.ruby-china.com \033[0m" \
&& bundle config mirror.https://rubygems.org https://gems.ruby-china.com \
&& echo -e "\033[36m 19. 正在更新 gems: gem update --system \033[0m" \
&& gem update --system \
&& echo -e "\033[36m 20. 正在安装 rails: gem install rails \033[0m" \
&& gem install rails \
&& echo -e "\033[32m sqlite3 --version: \033[0m" $(sqlite3 --version) \
&& echo -e "\033[32m node --version: \033[0m" $(node --version) \
&& echo -e "\033[32m yarn --version: \033[0m" $(yarn --version) \
&& echo -e "\033[32m ruby --version: \033[0m" $(ruby --version) \
&& echo -e "\033[32m gem --version: \033[0m" $(gem --version) \
&& echo -e "\033[32m rails --version: \033[0m" $(rails --version) \
&& echo -e "\033[32m yarn config get registry: \033[0m" $(yarn config get registry) \
&& echo -e "\033[32m gem sources -l: \033[0m" $(gem sources -l);
