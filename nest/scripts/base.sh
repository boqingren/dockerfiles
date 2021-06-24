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
&& echo -e "\033[36m 8 .正在设置 npm taobao 源: npm config set registry https://registry.npm.taobao.org/ \033[0m" \
&& npm config set registry https://registry.npm.taobao.org/ \
&& echo -e "\033[36m 9. 正在清除 npm 缓存: npm cache clean -f \033[0m" \
&& npm cache clean -f \
&& echo -e "\033[36m 10. 正在更新 yarn：npm update -g yarn \033[0m" \
&& npm update -g yarn \
&& echo -e "\033[36m 11. 正在设置 yarn taobao 源: yarn config set registry https://registry.npm.taobao.org/ \033[0m" \
&& yarn config set registry https://registry.npm.taobao.org/ \
&& echo -e "\033[36m 12. 正在安装 yarn：yarn global add @nestjs/cli \033[0m" \
&& yarn global add @nestjs/cli \
&& echo -e "\033[32m node --version: \033[0m" $(node --version) \
&& echo -e "\033[32m yarn --version: \033[0m" $(yarn --version) \
&& echo -e "\033[32m npm --version: \033[0m" $(npm --version) \
&& echo -e "\033[32m nest --version: \033[0m" $(nest --version) \
&& echo -e "\033[32m yarn config get registry: \033[0m" $(yarn config get registry) \
&& echo -e "\033[32m npm config get registry: \033[0m" $(npm config get registry)