---
title: 'git ssh 生成'
date: 2018-11-23 10:40:33
tags: 
  - gradle
  - maven
---

### 新建变量
    变量名：GRADLE_HOME
    变量值：解压到的目录

    变量名：GRADLE_USER_HOME
    变量值：自定义Gradle仓库目录或者Maven的仓库目录
    
    变量名：Path
    变量值：%GRADLE_HOME%\bin;
    
### 配置Gradle仓库源
    在Gradle安装目录下的 init.d 文件夹下，新建一个 init.gradle 文件，里面填写以下配置。

```shell script
allprojects {
    repositories {
        maven { url 'file:///C:/Java/maven_repository'}
        mavenLocal()
        maven { name "Alibaba" ; url "https://maven.aliyun.com/repository/public" }
        maven { name "Bstek" ; url "http://nexus.bsdn.org/content/groups/public/" }
        mavenCentral()
    }

    buildscript { 
        repositories { 
            maven { name "Alibaba" ; url 'https://maven.aliyun.com/repository/public' }
            maven { name "Bstek" ; url 'http://nexus.bsdn.org/content/groups/public/' }
            maven { name "M2" ; url 'https://plugins.gradle.org/m2/' }
        }
    }
}
```