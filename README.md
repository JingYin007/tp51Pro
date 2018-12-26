## 简介

- 此项目，实现的后台管理功能自然还不全面，可根据自己的需求进行功能扩展
- 欢迎指摘，谢谢...

- 可参考博文
 > [moTzxx-CMS —— [一个基于PHP代码的后台管理系统(ThinkPHP5.1)]](http://blog.csdn.net/u011415782/article/details/79307673)
 
 - 基本配置过程中出现的问题，我都在上面文章中做了整理，请详细阅读
-------------------------------------------------
## ①. 环境

- 框架： ThinkPHP 5.1.2
- PHP:  PHP7
- 操作系统： Win10

## ②. 安装

>对于项目的安装配置,毕竟是两种不同的框架设计，所以在使用上，需要 `“因材施教”`，在此进行分别指导说明

- ### 第一步. 执行下面的命令，加载 `ThinkPHP` 框架核心代码
```
composer install
```
![](https://img-blog.csdnimg.cn/20181126191857684.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTE0MTU3ODI=,size_16,color_FFFFFF,t_70)

- ### 第二步. 获取数据库数据

> 为了操作方便，建议打开 `MySql `管理工具，直接运行所提供的  `database/tp5_pro.sql`  数据库文件

![](https://img-blog.csdnimg.cn/2018112120255220.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTE0MTU3ODI=,size_16,color_FFFFFF,t_70)

- ***说明信息***
```
> 其次就是到 config/database.php 文件中，配置正确的数据库连接信息
  这是鄙人的默认数据，后期可自行修改优化.
> 注意前面的 运行 composer 命令;
  强烈建议学习新版本的框架，要学会使用composer哦；
```
> 无聊的话，也可以试看一下之前写的一篇 `Composer` 简单使用 ——   [Composer de涉水初探](https://blog.csdn.net/u011415782/article/details/77198390)

- ### 第三步. 修改开源框架 `Ueditor` 的配置项

>  可参考之前的文章 —— 【[Laravel 框架集成 UEditor 编辑器的方法](http://blog.csdn.net/u011415782/article/details/78909750)】 ,为保证项目的正常使用，示例图如下：

![在这里插入图片描述](https://img-blog.csdnimg.cn/20181128122623711.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTE0MTU3ODI=,size_16,color_FFFFFF,t_70)

- ***说明信息***
```
> 为了图片的正常显示，建议修改 "public/ueditor-mz/php/config.json" 文件
> 当然，如果将参数 “imageUrlPrefix” 什么都不填写；
> 同一域名下自然是可以访问到静态图片的；
> 但是，如果向外提供数据，就无法获取图片资源；
> 比如我进行小程序设计时（不在一个域），接口数据中无法捕获图片资源，自然就无法正确使用
> 另外，如果涉及到不同的资源服务器，更要考虑到 FTP上传，可要好好优化咯.
```


## Ⅲ. 浏览器访问

> 对于配置完成后的访问，一般都是需要自行配置虚拟域名的哦

- 以我的操作为例，在自己的集成环境 `PhpStudy` 服务中:
```
> 配置的虚拟域名为 tp51Pro.com ;
> 选用的服务器为 apache ;
> PHP版本：5.6+ （请选择高版本，以避免不支持的情况）
```
> 如果使用的是 `Nginx` 做服务器，需要进行 `URL 重写` 的设置，可参考文章 :【[ThinkPHP5.1 配置Nginx/Apache下的 URL重写](https://blog.csdn.net/u011415782/article/details/84032671)】

-  则入口网址为：
```
> 前台 ： tp51pro.com/
> 后台 ：
	    tp51pro.com/cmsx (推荐)
	    tp51pro.com/cms/index/index
	    tp51pro.com/cms/login/index.html
	    
	    登录数据  ——  [用户名]:moTzxx@admin  [密码]:admin 
```

- 前台登录效果，仅为参考，毕竟主要的任务时进行后台管理的实现嘛
![](https://img-blog.csdnimg.cn/20181121203401368.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTE0MTU3ODI=,size_16,color_FFFFFF,t_70)

- 后台首页进入效果：
![](https://img-blog.csdnimg.cn/2018120319485061.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTE0MTU3ODI=,size_16,color_FFFFFF,t_70)

 
 
 
