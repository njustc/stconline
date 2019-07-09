# 测试中心在线业务系统

- 采用前后端分离的模式，前端开源框架：[umi](https://gitee.com/smallc/Sword) (基于 React、Ant Design)
- 后端采用Springboot
- 集成Activiti

## 项目架构





## 工程结构

项目的总体目录结构如下

```
├── client						--前端源代码
├── pom.xml						--父级maven
├── PROBLEM.md					--问题
├── server						--后端源代码
```

查看[前端](https://github.com/njustc/stconline/blob/dev/client/src/tree.md) / [后端](https://github.com/njustc/stconline/blob/dev/server/tree.md)目录结构

## 项目地址

-  核心框架项目地址: <https://github.com/njustc/stconline>

## 环境搭建

#### 开发工具:

- MySql: 数据库
- Tomcat: 应用服务器
- Git: 版本管理
- IntelliJ IDEA: 开发IDE
- Navicat for MySQL: 数据库客户端

#### 开发环境：

- Jdk7+
- Mysql5.5+
- Maven 3

### 本地部署说明

#### 2.0 

##### 前置环境要求

- maven
- jdk 8 (不可以为jdk11 12 )
- docker , docker-compose
- npm 或 cpmn

傻瓜版 单条指令  **测试 + 部署 + 运行**

在bash环境下，根目录下运行

```
bash setup.sh
```

直接一键测试 + 部署 + 运行；

完成后，浏览器内 输入  `localhost:8080` ，进入项目主页即可

------



#### 1.0 

##### 准备工作

- 需要安装
  - `maven`
  - `jdk 1.8` (由于jdk 近期版本不兼容性，使用 jdk 11 之后的版本在本环境下无法正常运行)

- 每次 `clone` 源码之后，需要先进入 `client`包，使用 `npm` 包管理工具进行打包

```
npm install
```

- 建议本地使用 `cnpm install` 镜像打包，或采取 `nrm` 对镜像进行调整

##### 简单部署

- 在 `npm` 依赖安装完成后，进入项目根目录下，输入如下指令

```
mvn package
```

此时项目自动进行构建，最终将 前端&后端的项目内容合并为一个整体 `jar` 包，路径位于 `server/target/stc.jar`

- 构建成功后，显示如下内容

```
[INFO] Reactor Summary:
[INFO] 
[INFO] stc 1.0.0 .......................................... SUCCESS [  0.358 s]
[INFO] stc-client 1.0.0 ................................... SUCCESS [ 22.242 s]
[INFO] stc-server 0.0.1-SNAPSHOT .......................... SUCCESS [ 13.520 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS

```

表示所有的内容打包成功。

仍旧在根目录下，输入如下指令

```
java -jar server/target/stc.jar
```

项目可以直接运行，并且在浏览器中输入 `localhost:8080` 即可进入项目主页