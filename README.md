# [bga-ss-docker](https://hub.docker.com/r/bingoogolapple/bga-ss)

## 提示

* 提示1：「管理员账号为：bga-ss@bga-ss.com，默认密码为：123456，登录后请修改默认密码」
* 提示2：「必须暴露容器的 8003 端口，也就是 web 访问的端口」「6660-6680 可以改成你自己想要的，但不能是 8000、8001、8002，8003」

## 第一次运行时的执行步骤

> 基于 redis:5.0.3-alpine 镜像创建并启动名叫 bga-ss-redis 的容器，容器名称必须叫 bga-ss-redis

```
docker run --name bga-ss-redis -d redis:5.0.3-alpine
```

> 基于 bingoogolapple/bga-ss:v5 镜像创建并启动名叫 bga-ss 的容器，并连接到 bga-ss-redis

```
docker run -d -p 8003:8003 -p 6660-6680:6660-6680 --link bga-ss-redis --name bga-ss bingoogolapple/bga-ss:v5
```

## 容器停止了重新运行时的执行步骤

> 重新启动之前创建的容器 bga-ss

```
docker start bga-ss
```

## 备份与恢复

> 备份

```
docker cp bga-ss:/etc/ssmgr ~/ssmgr
```
> 恢复

```
docker cp /root/ssmgr/db/ss.sqlite bga-ss:/etc/ssmgr/db
docker cp /root/ssmgr/db/webgui.sqlite bga-ss:/etc/ssmgr/db
```