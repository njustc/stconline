## 后端模块

### 后端部署步骤

#### 1 准备工作

需要安装如下内容

- docker
- docker-compose
- maven
- jdk 1.8

#### 2 mysql部署工作

##### 2.1 执行 `yml` 文件，建立本地mysql

```
docker-compose up -d
```

注：

- mysql映射至本地33306端口，若本地已有数据库运行，需要先关闭，避免端口被占用而使容器生成失败
- `/server/mysql` 文件夹初始化时必须为空文件夹，容器初始化后，镜像内的 `/var/lib/mysql/` 目录挂载至`/server/mysql`目录下。之后可以添加数据文件. 

- 查看容器状态 `docker ps` , 若出现

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
14da45c29d6c        mysql:5.7.21        "docker-entrypoint.s…"   14 minutes ago      Up 14 minutes       0.0.0.0:33306->3306/tcp   mysql
```

说明容器启动成功，可以进行进一步的操作. 否则需要查看挂载目录是否正常、docker-compose是否正确安装

- `yml`配置说明

| 名称             | 说明           |
| ---------------- | -------------- |
| 镜像名称         | `mysql:5.7.21` |
| 容器名称         | mysql          |
| 数据库用户       | root           |
| 数据库默认密码   | mysql          |
| 本系统数据库名称 | njustc         |

##### 2.2 本地sql文件载入

执行如下

```
docker exec -i mysql mysql -uroot -pmysql njustc < framework.sql
```

可以将 `framework.sql` 运行，导入到mysql容器中的 `njustc`数据库

##### 2.3 数据库sql文件导出

执行如下

```
docker exec -i mysql mysqldump -uroot -pmysql njustc > framework.sql
```

执行之后，能够将数据库表导出至 `framework.sql`


