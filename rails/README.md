# 一个用于学习 Ruby 和 Rails 的 Dockerfile
镜像的 DockerHub [https://hub.docker.com/r/boqingren/rails](https://hub.docker.com/r/boqingren/rails)，下载方式：`docker pull boqingren/rails:1.0.0`。


    // 1. 启动容器
    docker run -it --rm --name myrails -p 8080:8080 boqingren/rails:1.0.0
    docker run -it --rm --name myrails -p 8080:8080 -v /Users/jun/Workspace/Ruby/Rails:/root/workspace boqingren/rails:1.0.0

    // 2. 在容器里面起一个 rails 的 blog 应用，参考：https://guides.rubyonrails.org/getting_started.html#installing-ruby
    cd /root/workspace && rails new blog && cd ./blog && bin/rails server -b 0.0.0.0 -p 8080

    // 3. 进入正在运行的容器
    docker exec -it myrails /bin/zsh

    // 4. 打包一个镜像，示例：docker build -t boqingren/rails:1.0.0 ./
    docker build -t [PATH]/[TITLE]:[VERSIONS] ./

    // 5. 其他命令
    docker images                     // 查看镜像列表
    docker rmi boqingren/rails:1.0.0  // 删除某个镜像
    docker ps                         // 查看容器列表
    docker rm -f myrails              // 删除某个容器

# 镜像里安装了一些工具，如果不需要可以自己在 Dockerfile 里面去掉
    ...
    # 安装一些其他的工具：ifconfig、tree、vim、zsh，如果不需要可以注释掉下面这行代码
    RUN /bin/bash ./scripts/utils.sh
    ...

# Oh My Zsh 及插件安装注意事项
1. 参考[《Oh My Zsh，让你的终端从未这么爽过》](https://cloud.tencent.com/developer/article/1152727)。
2. 由于大陆访问受限的原因，`http://mimosa-pudica.net/src/incr-0.2.zsh` 基本不可访问，我把 `incr-0.2.zsh` 下载下来后重名为 `incr.zsh`，并将其放在了本仓库的 `libs` 目录下。
3. Oh My Zsh 的 GitHub 仓库已更新，`https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh` 已经失效了，我把 Oh My Zsh 的 GitHub 仓库下载下载了，并将其放在了 `libs` 目录下，真正发挥作用的脚本是 `/libs/ohmyzsh/tools/install.sh`。当然，你也可以根据这个路径去下载 `https://github.com/ohmyzsh/ohmyzsh/blob/master/tools/install.sh`，截止 2012 年 6 22 日为止，这个链接是有效的。