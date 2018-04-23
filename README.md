# peso

peso是一个极简的配置中心框架，相比于diamond和disconf等分布式配置中心框架，不强制使用zookeeper和Redis，仅需配置基本的Tomcat和mysql信息即可。功能包括：
1. 提供后台管理页面，进行配置组和配置文件的管理。
2. 提供客户端程序，以支持调用方在Tomcat启动时从peso拉取配置信息。
    
## Quick Start

- 在你的项目pom.xml中添加Maven依赖：

```xml
<dependency>
    <groupId>ren.maojiang</groupId>
    <artifactId>peso-client</artifactId>
    <version>0.0.1</version>
</dependency>
```

- 在web.xml中设置配置中心文件路径，其中${global.config.path}是在Tomcat启动参数中定义（详见步骤4）

```xml
<context-param>
    <param-groupName>pesoConfigLocation</param-groupName>
    <param-value>${global.config.path}/global.properties</param-value>
</context-param>
```

同时在web.xml中加入peso的监听器：

```xml
<listener>
    <listener-class>ren.maojiang.peso.client.listener.ConfigListener</listener-class>
</listener>
```

需要注意的是，这个监听器必须放在最顶层加载。

- 按照上述描述在服务器上新建配置文件global.properties，并在其中设置peso服务器的地址：

```
peso.server.host=127.0.0.1:8080
```

- 在服务器启动脚本中加入启动参数：

```
-Dglobal.config.path=/path/to/peso/root
```

- 在你的项目spring配置主文件（一般是applicationContext.xml）中，顶级插入：

```xml
<import resource="classpath*:/peso/peso-config.xml" />
```

- 目录说明：

```
 peso
 |_dist：项目启动时，peso会请求配置中心，将相关配置下载到此目录下，Spring容器将从这个目录下扫描配置的properties文件
 |_global.properties：用于配置peso服务器的各种全局信息，例如服务器url等
 |_pools：项目启动时，会从此目录下扫描项目信息，项目信息保存在与项目同名的properties文件中，可以同时存在多个项目的信息
    |_pool_name：项目名称
        |_env_name：环境名称（例如develop, master, production）
```
