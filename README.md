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

## 作者联系方式

| 个人主页 | 邮箱 |
| ------------- | ------------ |
| <a  href="https://www.bingoogolapple.cn" target="_blank">bingoogolapple.cn</a>  | <a href="mailto:bingoogolapple@gmail.com" target="_blank">bingoogolapple@gmail.com</a> |

| 个人微信号 | 微信群 | 公众号 |
| ------------ | ------------ | ------------ |
| <img width="180" alt="个人微信号" src="https://github.com/bingoogolapple/bga-god-assistant-config/raw/main/images/BGAQrCode.png"> | <img width="180" alt="微信群" src="https://github.com/bingoogolapple/bga-god-assistant-config/raw/main/images/WeChatGroup1QrCode.jpg"> | <img width="180" alt="公众号" src="https://github.com/bingoogolapple/bga-god-assistant-config/raw/main/images/GongZhongHao.png"> |

| 个人 QQ 号 | QQ 群 |
| ------------ | ------------ |
| <img width="180" alt="个人 QQ 号" src="https://github.com/bingoogolapple/bga-god-assistant-config/raw/main/images/BGAQQQrCode.jpg"> | <img width="180" alt="QQ 群" src="https://github.com/bingoogolapple/bga-god-assistant-config/raw/main/images/QQGroup1QrCode.jpg"> |

## 打赏支持作者

如果您觉得 BGA 系列开源库或工具软件帮您节省了大量的开发时间，可以扫描下方的二维码打赏支持。您的支持将鼓励我继续创作，打赏后还可以加我微信免费开通一年 [上帝小助手浏览器扩展/插件开发平台](https://github.com/bingoogolapple/bga-god-assistant-config) 的会员服务

| 微信 | QQ | 支付宝 |
| ------------- | ------------- | ------------- |
| <img width="180" alt="微信" src="https://github.com/bingoogolapple/bga-god-assistant-config/raw/main/images/donate-wechat.jpg"> | <img width="180" alt="QQ" src="https://github.com/bingoogolapple/bga-god-assistant-config/raw/main/images/donate-qq.jpg"> | <img width="180" alt="支付宝" src="https://github.com/bingoogolapple/bga-god-assistant-config/raw/main/images/donate-alipay.jpg"> |

## 作者项目推荐

* 欢迎您使用我开发的第一个独立开发软件产品 [上帝小助手浏览器扩展/插件开发平台](https://github.com/bingoogolapple/bga-god-assistant-config)
