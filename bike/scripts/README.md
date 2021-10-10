# 运行容器
```sh
docker run -it --rm --name bike \
-v /Users/jun/Workspace/Docker/Dockerfiles/bike:/workspace/bootstrap \
--entrypoint /bin/bash ubuntu
```

# 执行脚本
```sh
# 1. 换源
/bin/bash /workspace/bootstrap//scripts/sources.sh
```
