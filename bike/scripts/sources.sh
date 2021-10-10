#!/usr/bin/env bash

clear;
echo -e "\033[36m 1. 创建并进入工作目录：mkdir /workspace && cd /workspace \033[0m";
if [ ! -d "/workspace" ]; then mkdir /workspace; fi;
cd /workspace;

echo -e "\033[36m 2. 若 /etc/apt/sources.list.backups 已存在，就还原到 /etc/apt/sources.list \033[0m";
if [ -f "/etc/apt/sources.list.backups" ];
  then cp /etc/apt/sources.list.backups /etc/apt/sources.list;
fi;

echo -e "\033[36m 3. 正在备份 /etc/apt/sources.list 到 /etc/apt/sources.list.backups \033[0m";
cp /etc/apt/sources.list /etc/apt/sources.list.backups;

echo -e "\033[36m 4. 正在把阿里源写到 /etc/apt/sources.list 文件中 \033[0m";
cat > /etc/apt/sources.list << EOF
deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
EOF

echo -e "\033[36m 5. 正在清除 apt-get 缓存: apt-get clean \033[0m" \
&& apt-get clean \
&& echo -e "\033[36m 6. 正在更新 /etc/apt/sources.list 源的索引: apt-get update \033[0m" \
&& apt-get update \
&& echo -e "\033[36m 7. 正在升级已安装的所有软件包: apt-get upgrade -y \033[0m" \
&& apt-get upgrade -y
