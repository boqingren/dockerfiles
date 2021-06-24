FROM node:latest
LABEL multi.maintainer="Jun" \
      multi.email="boqingren@hotmail.com" \
      multi.repository="https://github.com/boqingren/nest" \
      multi.description="本镜像仅用于学习，不保证生产上线的质量！"

# 设置工作目录，如果不存在则会创建
WORKDIR /root/workspace/bootstrap

# 拷贝当前目录到镜像的 /root/workspace/bootstrap
COPY ./ ./

# 构建 rails 基础环境
RUN /bin/bash ./scripts/base.sh

# 安装一些其他的工具：ifconfig、tree、vim、zsh，如果不需要可以注释掉下面这行代码
RUN /bin/bash ./scripts/utils.sh

# 设置默认的工作目录 /root/workspace 为 /root/workspace
WORKDIR /root/workspace

# 安装完环境的依赖，直接删除 /root/workspace/bootstrap
RUN rm -rf ./bootstrap

CMD /bin/zsh

ENTRYPOINT /bin/zsh

# 镜像对外暴露的端口
EXPOSE 3000
