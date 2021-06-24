#!/bin/bash

clear;
echo -e "\033[36m 1. 清理工作：rm -rf /root/.zshrc && rm -rf /root/.oh-my-zsh \033[0m";
if [ -f "/root/.zshrc" ]; then rm -rf /root/.zshrc; fi;           # cat /root/.zshrc
if [ -d "/root/.oh-my-zsh" ]; then rm -rf /root/.oh-my-zsh; fi;   # ls /root/.oh-my-zsh/plugins | grep incr

echo -e "\033[36m 2. 创建并进入工作目录：mkdir /root/workspace && cd /root/workspace \033[0m";
if [ ! -d "/root/workspace" ];
  then mkdir /root/workspace && cd /root/workspace;
  else cd /root/workspace;
fi;

echo -e "\033[36m 3. 正在安装 net-tools: apt-get install -y net-tools \033[0m" \
&& apt-get install -y net-tools \
&& echo -e "\033[36m 4. 正在安装 tree: apt-get install -y tree \033[0m" \
&& apt-get install -y tree \
&& echo -e "\033[36m 5. 正在安装 vim: apt-get install -y vim \033[0m" \
&& apt-get install -y vim \
&& echo -e "\033[36m 6. 正在安装 zsh: apt-get install -y zsh \033[0m" \
&& apt-get install -y zsh \
&& echo -e "\033[36m 7. 正在切换默认 shell 到 zsh: chsh -s /bin/zsh \033[0m" \
&& chsh -s /bin/zsh \
&& echo -e "\033[36m 8. 正在安装 oh my zsh: bash /root/workspace/bootstrap/libs/ohmyzsh/tools/install.sh \033[0m" \
&& bash /root/workspace/bootstrap/libs/ohmyzsh/tools/install.sh &

wait $! \
&& /bin/zsh -c "omz update" \
&& echo -e "\033[32m ifconfig/tree/vim/zsh 安装成功 \033[0m" \
&& echo -e "\033[32m ifconfig --version: \033[0m" $(ifconfig --version) \
&& echo -e "\033[32m tree --version: \033[0m" $(tree --version) \
&& echo -e "\033[32m vim --version | head -n 1: \033[0m" $(vim --version | head -n 1) \
&& echo -e "\033[32m zsh --version: \033[0m" $(zsh --version)
