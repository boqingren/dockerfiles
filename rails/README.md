# 一个用于学习 Ruby 和 Rails 的 Dockerfile
镜像的 DockerHub [https://hub.docker.com/r/boqingren/rails](https://hub.docker.com/r/boqingren/rails)，下载方式：`docker pull boqingren/rails:1.0.1`。


    // 1. 启动容器
    docker run -it --rm --name myrails -p 3000:3000 boqingren/rails:1.0.1
    docker run -it --rm --name myrails -p 3000:3000 -v /Users/jun/Workspace/Ruby/Rails:/root/workspace boqingren/rails:1.0.1

    // 2. 在容器里面起一个 rails 的 blog 应用，参考：https://guides.rubyonrails.org/getting_started.html#installing-ruby
    cd /root/workspace && rails new blog && cd ./blog && bin/rails server -b 0.0.0.0 -p 3000

    // 3. 进入正在运行的容器
    docker exec -it myrails /bin/zsh

    // 4. 打包一个镜像，示例：docker build -t boqingren/rails:1.0.1 ./
    docker build -t [PATH]/[TITLE]:[VERSIONS] ./

    // 5. 其他命令
    docker images                     // 查看镜像列表
    docker rmi boqingren/rails:1.0.1  // 删除某个镜像
    docker ps                         // 查看容器列表
    docker rm -f myrails              // 删除某个容器

# 镜像里安装了一些工具，如果不需要可以自己在 Dockerfile 里面去掉
    ...
    # 安装一些其他的工具：ifconfig、tree、vim、zsh，如果不需要可以注释掉下面这行代码
    RUN /bin/bash ./scripts/utils.sh
    ...

# Oh My Zsh 及插件安装注意事项
1. 参考[《Oh My Zsh，让你的终端从未这么爽过》](https://cloud.tencent.com/developer/article/1152727)。
2. Oh My Zsh 的 GitHub 仓库已更新，`https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh` 已经失效了，新的链接是 `https://github.com/ohmyzsh/ohmyzsh/blob/master/tools/install.sh`，我已经把新链接的文件下载并重命名为 `omz.sh` 放在了 `rails/scripts/` 目录下，截止 2012 年 6 月 24 日为止，这个新的链接是有效的。
