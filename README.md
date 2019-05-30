# 测试中心在线业务系统

- 采用前后端分离的模式，前端开源框架：[umi](https://gitee.com/smallc/Sword) (基于 React、Ant Design)
- 后端采用Springboot全家桶，并同时对其基础组件做了高度的封装，单独开源出一个框架：[BladeTool](https://github.com/chillzhuang/blade-tool)
- 集成Activiti从流量控制、熔断降级、系统负载等多个维度保护服务的稳定性。

## 项目架构



## 工程结构

...

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