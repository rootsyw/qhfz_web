---
title: "‎Google Gemini"
source: "https://gemini.google.com/u/2/app/3bf95c49b836b796?hl=zh-cn&pageId=none"
author:
  - "[[Gemini]]"
published:
created: 2026-01-27
description: "认识 Gemini：Google 旗下的 AI 助理。在写作、规划和开展头脑风暴等方面获得帮助。体验生成式 AI 的强大功能。"
tags:
  - "clippings"
---
## 与 Gemini 对话

下面这些步骤主要完成了什么？可以进一步简化嘛？

冬令营网站搭建指导手册

清华附中

20260126

  

目录

实验前置基础条件 1

1 基础环境搭建 2

1.1 Python + Pip 2

1.2 Visual Studio Code 5

1.3 Flask框架 20

1.4 Git工具 44

1.5 从DataCon竞赛平台获取实验所需云服务器 54

1.6 阿里云服务器购买 61

2 域名配置 63

2.1 域名注册 63

2.2 域名解析配置 70

2.3 DNS缓存清理 74

3 网站搭建 79

3.1 服务器上部署项目代码 79

3.2 服务器安装Flask 82

3.3 启动网站 83

3.4 Nginx配置 87

3.4 HTTPS配置 89

3.5 博客网站搭建 102



【环境介绍与实验目标】

‘欢迎来到“云端网站搭建”冒险之旅！在这个模块中，你将体验一次从“本地实验室”到“全球舞台”的奇妙转变——亲手搭建一个属于自己的网站，并把它安全地送上互联网！就像建造一座数字小屋：先在自己电脑上设计搭建（Flask开发），然后为它在云服务器上安个“家”（阿里云部署），最后挂上专属门牌（域名）并加上安全锁（HTTPS证书）。学完这个模块，你不仅能掌握网站开发的核心技能，还能理解真实网站如何运行在互联网上，让全世界的小伙伴都能安全访问你的创意成果！

本次实验将在本地Windows系统与远程阿里云Ubuntu服务器环境下，完成一个基于Flask框架的本次课程实验网站和一个基于Markdown转HTML博客网站从开发到安全部署的完整流程。首先，完成Python、Pip等基础运行环境的配置，学习、开发Flask应用和部署；之后，购买域名并将其解析指向阿里云服务器的公网IP，实现通过域名访问服务器的效果；接着，在服务器上部署本次课程实验网站源码，并为该网站申请TLS证书。通过Nginx设置反向代理，将外部HTTP/HTTPS的请求转发至服务器的本次课程实验网站；最后，学习Markdown转HTML快速生成网站，并实现通过Nginx额外部署个人博客网站。

【实验前置基础条件】

本实验涉及第三方平台账号注册、域名购买，为确保实验顺利进行，请所有学员确保上课时：

1\. 拥有一个上课时可登陆的个人电子邮箱用来接受邮箱验证码（推荐使用126、163邮箱），需要在上课前提前注册并在浏览器中登陆（必须）；

2\. 确保能够通过支付宝进行支付，预计支付金额为3-5美元（约合人民币20-30元）用来购买个人域名，请学生自备具备支付能力的手机、平板、电子手表等电子设备（按照学校要求统一管理）；如不具备上述条件，可在课上联系班主任协助支付。

3\. 实验基于Windows操作系统设计，如使用MacOS、Linux等其他操作系统，实验步骤可能与手册略有区别，需要自行解决可能面临的环境、步骤不一致问题。

4\. 使用手机号提前注册硅基流动账号（https://account.siliconflow.cn/zh/login），并且绑定个人邮箱，方便上课时通过邮箱登陆。

5\. 上课时能够随时访问网页版AI应用（DeepSeek、元宝、豆包等均可），本活动鼓励学生借助AI工具完成实验、解决问题。

1 基础环境搭建

1.1 Python + Pip

1.1.1 介绍Python与Pip

Python 是一种高级、解释型且通用的编程语言，以其简洁明了、类似英语的语法和出色的代码可读性而著称，非常适合编程初学者入门。同时，它功能极为强大，应用领域覆盖网页开发、数据分析、人工智能及自动化脚本等众多方面，并拥有一个由全球开发者共同构建的庞大生态系统，提供了数百万个第三方库和工具包，使得开发者能够轻松复用代码，快速实现复杂功能，而无需从零开始。

Pip 是 Python 的包管理工具，堪称 Python 的“软件管家”，其核心工作是从在线仓库（主要是 PyPI）中查找、安装、升级和卸载第三方库或包。借助 pip，用户只需使用简单的命令（如 pip install 包名 进行安装、pip list 列出已安装包、pip uninstall 包名 卸载包）即可高效管理依赖和扩展功能。

通常，在安装 Python（版本 3.4 或 2.7.9 以上）时，pip 会自动一同安装，无需额外安装。为开发者使用丰富的 Python 生态系统提供了极大便利,本书以python 3.14.2和 pip 25.3为例，介绍后续实验的操作。

1.1.2 安装Python与Pip

Python官网：https://www.python.org/

Python下载地址：https://www.python.org/downloads/ 本文以目前最新版本python 3.14.2为例进行后面实验，访问：https://www.python.org/downloads/release/python-3142/

下滑页面中找到 Windows installer (64-bit) 点击下载。

  

  

下载完成后，在本机双击python-3.14.2-amd64.exe进行安装，注意一定要选中 Add python.exe to PATH，将python解释器添加至系统全局变量中，否则需要自行手动配置，后续步骤默认点击即可。如忘记勾选，可再次执行安装程序，删除Python后重新安装。

  

为方便实验演示，这里我们将Python安装在 C:\\python 路径下，完成后可在C:\\python目录中看到对应的文件内容。

  

1.1.3 验证安装是否成功

按Win+R组合键，打开电脑CMD（Command Prompt，中文：命令提示符， Windows 操作系统中的一个命令行解释器）。

  

分别执行以下命令，若出现版本号即说明安装成功。

\# python --version

\# pip --version

  

1.2 Visual Studio Code

Visual Studio Code（VS Code）是一款由微软开发的免费、开源、跨平台代码编辑器，它以轻量级和高性能为核心，通过强大的扩展生态几乎支持所有编程语言和开发场景。VS Code不仅提供智能代码补全（IntelliSense）、集成调试器、内置Git控制和终端，还可借助海量扩展实现远程开发、容器管理、数据科学等高级功能，在简约编辑器与全功能IDE之间取得了完美平衡。其持续迭代的更新机制、高度可定制的界面以及活跃的社区支持，使其成为全球开发者首选的现代化开发工具，适用于从Web前端到云端微服务的各类项目。

1.2.1 安装VS Code

浏览器访问VS Code官网地址：https://code.visualstudio.com/ ，点击下载按钮。

  

  

当前最新版本为VS Code 1.107.1，下载完成后双击运行VSCodeUserSetup-x64-1.107.1.exe，为方便实验演示，本次安装路径为：D:\\VSCode\\Microsoft VS Code。

  

安装过程中，可为VS Code添加桌面快捷键，这样方便后期启动VS Code。

  

安装完成后，在桌面双击VS Code图标，启动VS Code。

  

1.2.2 安装第三方扩展

按照图例顺序，选中左方按钮，进入插件功能（EXTENSION）。

插件一：简体中文

搜索Chinese，选择Chinese (Simplified) Language Pack for Visual Studio Code，其核心功能只有一个，就是将 VS Code 的用户界面本地化为简体中文。

  

通过使用“Configure Display Language”命令显式设置 VS Code 显示语言，可以替代默认 UI 语言。 按下“Ctrl+Shift+P”组合键以显示“命令面板”，然后键入“display”以筛选并显示“Configure Display Language”命令。

  

  

此时会出现提示重启生效，点击 Restart 按钮，重启VS Code。

  

重启后，就能看到VS Code中呈现为简体中文样式。

  

插件二：Python

Python插件是一个官方开发的强大扩展，它将轻量级的代码编辑器转变为功能完备的Python集成开发环境（IDE）。该插件提供了代码智能补全、语法高亮、定义跳转等核心编辑功能，并集成了可视化调试器、多种代码格式化与检查工具。它让开发者能直接在编辑器中管理Python解释器和虚拟环境、运行单元测试，甚至无缝编写和运行Jupyter Notebook，从而显著提升从Web开发、数据分析到机器学习等各类Python项目的开发效率与体验。

  

使用快捷键 Ctrl+Shift+P 输入 Python: Select Interpreter ，择已安装的Python解释器。

  

下面演示创建一个新Python文件的操作过程。

  

  

  

编辑Python文件内容。

  

按Ctrl + S保存文件，指定保存的路径，这里以保存的桌面为例。

  

  

插件三：Remote-SSH

Remote-SSH插件允许开发者通过安全的SSH协议，直接连接到远程服务器、虚拟机或容器，并在本地VS Code界面中获得与本地开发几乎无异的完整开发体验。开发者可以像操作本地文件一样，在远程机器上无缝地浏览、编辑、运行和调试代码，同时还能安装和使用各种VS Code扩展。这消除了环境配置差异带来的困扰，特别适用于需要在远程高性能服务器、专属测试环境或统一生产环境中进行开发的场景，极大地简化了远程开发工作流。

  

  

下图为两个ssh连接配置的样例，第一个为使用常规密码登录服务器，第二个是使用公钥免密登录服务器。编辑、保存右侧配置文件后，左侧就会出现对应的服务列表名称。本实验中需要学生替换为自己的服务器IP地址和用户名。如需使用公钥免密登录请自行了解，本实验不做要求。如何获取服务器地址请参考1.5章节 从DataCon竞赛平台获取实验所需云服务器。

  

完成配置后，点击连接按钮。

  

初次登录时需要指定服务器的系统类型,本课程统一使用linux系统。

  

  

每次登录时都需要输入密码，已配置公钥免密登录的无需输入密码。

  

连接成功示意图：

  

连接成功后可创建新文件，直接远程对文件进行内容编辑。如需运行Python文件，可参考1.2.3 VS Code终端，在VS Code中通过远程终端执行Python命令。

  

也可选择打开远程文件夹，默认会出现根路径（/）下的所有文件夹，这里以打开 /root/ 为例。

  

  

连接成功后，在左侧就能看到 /root/ 文件夹中的所有文件目录。

  

可通过拖拽本地主机文件到该目录，实现上传本地文件到服务器指定路径的效果。

  

上面演示的是将本地文件上传到服务器，这里演示如何将服务器文件下载到本地。右键服务器目录栏中要下载的文件，点击下载按钮可从服务器下载文件到本地。

  

如果未断掉当前远程登录状态就直接关闭VS Code，那么之后打开VS Code就会自动恢复上次的异常中断。下面演示如何手动关闭远程连接。

  

1.2.3 VS Code终端

打开终端方式一：

在顶部工具栏中选择终端、新建终端。

  

打开终端方式二：

或者使用快捷键： ” Ctrl + ~ ” 在VS Code中打开终端。

  

  

若当前终端被占用，可增加多个终端。

  

  

1.3 Flask框架

Flask是一个基于Python的轻量级Web应用框架，以其简洁灵活的设计理念受到开发者广泛欢迎。它提供了核心的请求-响应处理与路由功能，允许开发者通过丰富的第三方扩展（如数据库集成、表单验证、用户认证等）按需构建复杂应用，既适合快速搭建原型与API服务，也能支撑企业级产品开发。许多知名公司如Netflix、Uber、豆瓣网以及字节跳动的部分后台系统均采用Flask构建高效可靠的服务，体现了其在生产环境中的强大扩展性与实用性。

1.3.1 安装Flask

可使用VS Code终端直接安装Flask，如在本地VS Code中安装Flask。

\# pip install flask

  

1.3.2 Flask简单网站代码

新建app.py文件，并写入：

\# 导入Flask类，用于创建Web应用

from flask import Flask

\# 创建Flask应用实例，\_\_name\_\_表示当前模块名，用于确定应用根目录

app = Flask(\_\_name\_\_)

\# 使用装饰器定义路由，将URL路径'/'与下面的函数绑定

@app.route('/')

def hello\_world():

\# 当用户访问根路径时，返回字符串'Hello, World!'作为响应

return 'Hello, World!'

\# 判断当前模块是否作为主程序运行（而不是被import导入）

if \_\_name\_\_ == '\_\_main\_\_':

\# 启动Flask开发服务器

\# host='0.0.0.0': 允许外部设备通过服务器IP访问

\# port=8080: 监听8080端口

\# debug=True参数开启调试模式：

\# 1. 代码修改后自动重启服务器

\# 2. 提供详细的错误页面

\# 3. 禁用生产环境优化

app.run(host='0.0.0.0', port=8080,debug=True)

根据上面的app.py可以清楚地看到，其实Flask核心代码主要分为三部分。第一部分是创建Flask应用实例对象；第二部分是对浏览器访问网站的URL进行处理并返回相应的内容（路由系统），上面案例中直接返回字符串，真实环境中将返回指定的HTML页面或跳转到其他页面；第三部分主要负责网站对外开放的IP和端口等基本信息。

在VS Code中启动上述app.py，根据提示，可以看到网站已部署到本地8080端口。

  

选择http://127.0.0.1:8080,CTRL+鼠标点击直接打开该连接，或复制到浏览器中访问，所能看到的就是Flask框架呈现的一个最简单案例。

  

1.3.3 Flask路由系统

路由（路径）是Web应用中定义URL与处理函数之间映射关系的核心机制。

Flask中@app.route的第一个字符串参数叫做URL，被@app.route装饰的函数叫做视图函数。通过以下6个案例来讲解Flask中基本的路由设定。

app.py

from flask import Flask, request, jsonify

app = Flask(\_\_name\_\_)

###案例1###

@app.route('/') # 这里的'/'就是URL

def home(): # 这里的home()就是视图函数

return '欢迎来到首页！'

###案例2###

@app.route('/hello')

@app.route('/hi')

@app.route('/greet')

def greet():

return '你好！访问 /hello 或 /hi 或 /greet'

###案例3###

@app.route('/user/<username>')

def show\_user\_profile(username):

return f'用户: {username} 的个人主页'

###案例4###

@app.route('/post/<int:post\_id>')

def show\_post(post\_id):

return f'文章ID: {post\_id} 的内容'

###案例5###

@app.route('/api', methods=\['GET', 'POST'\])

def handle\_api():

if request.method == 'GET':

return jsonify({'method': 'GET请求成功'})

else:

return jsonify({'method': 'POST请求成功'}), 201

###案例6###

\# /photos "拍照"这个功能按钮

@app.route('/photos')

def take\_photo():

return "📸 点击这里拍照"

\# /books/ "所有书"的列表

@app.route('/books/')

def view\_books():

return '''

📁 你的所有书：

\- 书1.jpg

\- 书2.jpg

\- 书3.jpg

'''

if \_\_name\_\_ == '\_\_main\_\_':

app.run(host='0.0.0.0', port=8080,debug=True)

1\. 基本路由（默认路由） - 绑定首页函数

@app.route('/')

def home():

return '欢迎来到首页！'

作用：当用户访问 http://127.0.0.1:8080/ 时触发，通常作为网站的入口点，对应服务器的根目录。

  

2\. 多个路由规则绑定同一个函数

@app.route('/hello')

@app.route('/hi')

@app.route('/greet')

def greet():

return '你好！访问 /hello 或 /hi 或 /greet'

作用：URL别名：多个URL指向同一功能，向后兼容：保留旧URL的同时使用新URL，用户体验：提供多种访问方式。

示例：访问http://127.0.0.1:8080/hello、http://127.0.0.1:8080/hi、http://127.0.0.1:8080/greet都返回同一页面。

  

  

  

3\. 动态路由 - 绑定用户页面函数

@app.route('/user/<username>')

def show\_user\_profile(username):

return f'用户: {username} 的个人主页'

作用：URL模式匹配：匹配 /user/ 后任意非斜杠字符，参数传递：<username> 捕获URL中的值传递给函数，实际应用：用户个人主页、商品详情页等

示例访问：

http://127.0.0.1:8080/user/admin → 显示“用户: admin 的个人主页”。

  

http://127.0.0.1:8080/user/admin/1 → “ 404错误”。

  

4\. 类型转换 - 绑定文章详情函数@app.route('/post/<int:post\_id>')

@app.route('/post/<int:post\_id>')

def show\_post(post\_id):

return f'文章ID: {post\_id} 的内容'

作用：1. 类型验证：确保 post\_id 是整数；2. 自动转换：将字符串参数转换为指定类型。

类型保护：/post/abc 会返回404错误（不是整数）。

支持的类型：

int：整数

float：浮点数

path：包含斜杠的字符串

uuid：UUID字符串

例如访问：

https://127.0.0.1:8080/post/123 → 显示"文章ID: 123 的内容"

  

https://127.0.0.1:8080/post/abc → 404错误

  

https://127.0.0.1:8080/post/→ 404错误

  

4\. 多方法路由 - 绑定API函数

@app.route('/api', methods=\['GET', 'POST'\])

def handle\_api():

if request.method == 'GET':

return jsonify({'method': 'GET请求成功'})

else:

return jsonify({'method': 'POST请求成功'}), 201

作用：HTTP方法区分：同一URL根据请求方法执行不同逻辑；RESTful API设计：符合REST架构风格。

示例：

GET方式：

http://127.0.0.1:8080/api → 获取数据

  

POST方式：

http://127.0.0.1:8080/api → 创建数据

浏览器默认使用GET方法，这里使用Curl命令。状态码控制：POST请求返回201（Created）状态码。

  

返回的内容中出现了Unicode编码的结果，可使用在线网站来翻译对应的中文内容。https://www.jyshare.com/front-end/3602/

  

6\. 路径参数带斜杠

无斜杠通常用于表示一个具体资源或操作；有斜杠表示这是一个“目录”或资源集合。

\# /photos "拍照"这个功能按钮

@app.route('/photos')

def take\_photo():

return "📸 点击这里拍照"

\# 访问结果：

\# /photos ✅ 显示内容

\# /photos/ ❌ 404错误

  

  

\# /photos/ "所有照片"的列表

@app.route('/books/')

def view\_books():

return '''

📁 你的所有书：

\- 书1.jpg

\- 书2.jpg

\- 书3.jpg

'''

  

\# 访问结果：

\# /books ⚠️ 自动301重定向到 /books/

\# /books/ ✅ 显示内容

1.3.4 Flask文件目录结构

Flask项目结构/

│

├── app.py # 主应用文件

├── xxx.py # 自定义功能模块

├── requirements.txt # 依赖列表

├── static/ # 静态文件

│ ├── css/ #CSS样式文件

│ ├── js/ #JS样式文件

│ └── images/ #图片

└── templates/ # 模板文件

└── index.html #html文件

app.py 是Flask应用的入口和核心控制文件，它负责：

1\. 创建Flask应用实例 - 初始化整个Web应用

2\. 配置路由和视图函数 - 定义URL与处理逻辑的映射关系

3\. 整合各个模块 - 导入并使用xxx.py中的自定义功能

4\. 启动开发服务器 - 运行Flask应用

与其他文件的关系：

1\. 调用 xxx.py 中的业务逻辑和工具函数

2\. 渲染 templates/ 中的HTML模板并返回给客户端

3\. 引用 static/ 中的CSS、JS、图片等静态资源

4\. 依赖 requirements.txt 中列出的Python包运行

简单说：app.py像是项目的大脑，它接收请求、协调各模块工作、返回响应，将MVC架构中的Controller（控制器）角色。

1.3.5 Flask模板渲染与重定向

上面我们举的例子都是页面返回字符串，但是真实环境中，网站返回的是网页。Flask中的网站页面使用的是HTML文件，HTML（超文本标记语言）是构建所有网页和网络应用最基础、最核心的骨架代码。

超文本：指的是它不仅包含文字，还能包含链接，可以跳转到其他文档、图片、视频等，形成一个互联的“超”网络。

标记语言：它不是编程语言，而是一种用标签来“标记”内容的语言。标签用来告诉浏览器某段内容是什么（比如是标题、段落还是图片）。

HTML使用由尖括号 < > 包围的标签来工作。标签通常是成对出现的但也有非成对的，如：

<p> 和 </p> 定义了一个段落。

<strong> 和 </strong> 定义重要文本，通常显示为加粗。

<a> 中可定义一个超链接，href 属性指定了链接地址。

<img> 定义了一张图片，src 属性指定了图片来源，alt 是替代文本。

每个HTML网页都遵循一个标准结构，这里使用VS Code创建一个HTML文件。

在html.html中写入以下内容：

<!DOCTYPE html> <!-- 声明文档类型为HTML5 -->

<html lang="zh-CN"> <!-- 根标签，lang属性定义语言为中文 -->

<head>

<!-- 头部：包含元信息，不直接显示在页面上 -->

<meta charset="UTF-8"> <!-- 定义字符编码，防止乱码 -->

<title>我的第一个网页</title> <!-- 浏览器标签页上显示的标题 -->

<link rel="stylesheet" href="style.css"> <!-- 链接外部CSS样式表 -->

</head>

<body>

<!-- 主体：所有显示在网页上的内容都放在这里 -->

<h1>这是一个一级标题</h1>

<p>这是一个段落，包含一个<a href="http://www.baidu.com" target="\_blank">链接</a>。</p>

<img src="logo.png" alt="网站Logo">

<script src="script.js"></script> <!-- 链接外部JavaScript文件 -->

</body>

</html>

右击html.html文件，点击打开方式，选择任意浏览器打开。

HTML、CSS、JavaScript关系

1\. HTML： 结构与骨架

角色：盖房子的砖瓦和钢筋。它定义了网页有什么内容，以及这些内容的基本结构。

功能：创建段落、标题、图片、链接、列表、表格等元素。它搭建出网页的“毛坯房”。

比喻：

</h1> 是房子的门牌（标题）。

<p> 是房间里的一段文字。

<img> 是墙上挂的一幅画。

<a> 是通往另一个房间的门（链接）。

没有它：网页将没有任何内容，一片空白。

2\. CSS： 外观与装修

角色：房子的装修和装饰。它负责让网页变得美观。

功能：控制HTML元素的颜色、字体、大小、间距、背景、布局（如并排、居中）等所有视觉样式。

比喻：

把标题 </h1> 刷成红色，字体变大。

把段落 </p> 的文字调成舒适的灰色和行高。

把图片 </img> 加上一个圆角边框和阴影。

决定客厅（一个区域）和卧室（另一个区域）如何并排布局。

没有它：网页会像一份没有任何格式的纯文本文档，只有最基本的结构，非常丑陋。

3\. JavaScript： 功能与交互

角色：房子的水电、智能系统和管家。它让网页“动”起来，能响应用户。

功能：实现所有动态功能和交互逻辑。例如：点击按钮弹出菜单、轮播图自动切换、表单验证、从服务器获取新数据并更新页面部分内容等。

比喻：

按下电灯开关（点击按钮），灯就亮了（显示/隐藏内容）。

门铃响了（事件触发），你去开门（执行函数）。

恒温器（JS逻辑）根据室温自动调节空调（动态更新页面数据）。

管家（JS）可以根据你的指令，从仓库（服务器）取一件新家具（数据）放进房间（更新DOM）。

没有它：网页是静态的、无法交互的“宣传册”，用户只能看，不能进行任何操作。

模板渲染是将数据嵌入HTML后返回给用户，而重定向是让浏览器自动跳转到另一个URL地址。

模板渲染：服务器生成完整HTML → 用户看到新内容（URL地址不变）

重定向：服务器返回“跳转指令” → 浏览器请求新地址 → 用户看到新内容（URL地址变化）

核心区别：渲染是直接给结果，重定向是让浏览器换个地方要结果。

Flask中一般使用下面的三个函数控制返回的html页面:

函数

作用

返回值

常见使用场景

render\_template()

渲染指定的HTML模板文件

HTTP响应（HTML页面）

显示页面内容

redirect()

重定向到其他URL

HTTP重定向响应

页面跳转、表单提交后

url\_for()

根据视图函数名生成URL字符串

字符串（URL）

在模板或代码中生成链接

通过下面的简单例子来解释上面三个函数的使用方法，假设Flask项目结构、app.py、hello.html文件内容如下：

├── app.py

└── templates/

└── hello.html

app.py

from flask import Flask, render\_template, redirect, url\_for

app = Flask(\_\_name\_\_)

@app.route('/nihao/')

@app.route('/nihao/<name>')

def saynihao(name=None):

\# 如果没有传入name参数，使用默认值"小明"

if name is None:

name = "小明"

return render\_template('hello.html', name=name)

\# 重定向1：使用固定参数

@app.route('/gonihao')

def go\_nihao():

\# 重定向到/nihao/小红

return redirect('/nihao/小红')

\# 重定向2：使用url\_for带参数

@app.route('/gosayhello')

def go\_sayhello():

\# 重定向到/nihao/小刚

return redirect(url\_for('saynihao', name='小刚'))

if \_\_name\_\_ == '\_\_main\_\_':

app.run(host='0.0.0.0', port=8080,debug=True)

hello.html

<!DOCTYPE html>

<html>

<body>

<h1>你好，{{ name }}！</h1>

<p>这是一个最简单的Flask页面</p>

<!-- 方法1：通过查询参数传递 -->

<a href="{{ url\_for('saynihao', name='小东') }}">点击回到首页（小东）</a>

</body>

</html>

使用Python运行app.py，访问效果如下：

1\. 访问http://127.0.0.1:8080/nihao/，若未接收到参数将使用默认参数值，该案例中的默认参数值是"小明"。

  

2\. 假如指定参数为"小李"，如访问：http://127.0.0.1:8080/nihao/小李

  

3\. 访问http://127.0.0.1:8080/gonihao

  

4\. http://127.0.0.1:8080/gosayhello

  

5\. 点击“点击回到首页（小东）“

  

1.3.6 Flask模板继承

Flask中的模板继承是一种DRY（Don't Repeat Yourself）的设计模式，它允许你创建一个基础模板（base template）来定义网页的通用结构（如页头、导航栏、页脚等），然后让其他子模板继承这个基础模板并只填充各自独特的内容区域。这就像制作印章：基础模板是印章的底板，定义了固定不变的边框和样式；子模板则是每次盖章时填入的不同文字内容。通过使用{% block %}标签在基础模板中定义可替换的内容块，子模板用{% extends %}声明继承关系后，只需用相同的{% block %}标签重写需要变化的部分（如页面主体），而无需重复编写整个HTML结构。这样既保持了网站风格的一致性，又大大减少了代码重复，让维护和修改变得更加高效。

通过下面案例来讲解Flask中模板基础，假设Flask项目结构：app.py、base.html、home.html、about.html如下所示，在base.html中定义了一个网站的导航栏，网站的所有页面中都需要使用这个导航栏，那么在该网站的其他HTML页面只需要使用{% extends "base.html" %}就能直接导入这个导航栏，不同的是，除过导航栏一样，页面中的内容可使用{% lock %}和{% endblock %}实现自定义效果。

flask\_template\_demo/

├── app.py

└── templates/

├── base.html # 基础模板

├── home.html # 首页（继承base）

└── about.html # 关于页面（继承base）

app.py

from flask import Flask, render\_template

app = Flask(\_\_name\_\_)

@app.route('/')

def home():

return render\_template('home.html')

@app.route('/about')

def about():

return render\_template('about.html')

if \_\_name\_\_ == '\_\_main\_\_':

app.run(host='0.0.0.0', port=8080,debug=True)

templates/base.html（基础模板）

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>简单的Flask网站</title>

<style>

body {

margin: 0;

font-family: Arial;

}

.nav {

background: #333;

padding: 10px;

}

.nav a {

color: white;

margin: 0 15px;

text-decoration: none;

}

.content {

padding: 30px;

min-height: 400px;

}

.footer {

background: #333;

color: white;

text-align: center;

padding: 15px;

}

</style>

</head>

<body>

<!-- 导航栏 - 所有页面都一样 -->

<div class="nav">

<a href="/">🏠 首页</a>

<a href="/about">📖 关于</a>

<a href="#">📞 联系</a>

</div>

<!-- 内容区域 - 子页面会改变这里 -->

<div class="content">

{% block content %}

<!-- 子模板的内容会放在这里，实现不同页面不同的内容效果。-->

{% endblock %}

</div>

<!-- 页脚 - 所有页面都一样 -->

<div class="footer">

<p>© 2026 我的网站 | 底部导航</p>

</div>

</body>

<html>

templates/home.html（首页 - 继承base）

{% extends "base.html" %}

{% block content %}

<h1>欢迎来到首页</h1>

<p>这是网站的主页面。</p>

<p>我只写了内容，导航和页脚都是base.html提供的。</p>

<h2>特点：</h2>

<ul>

<li>导航栏自动显示</li>

<li>页脚自动显示</li>

<li>我只需关注内容</li>

</ul>

{% endblock %}

templates/about.html（关于页面 - 继承base）

{% extends "base.html" %}

{% block content %}

<h1>关于我们</h1>

<p>这是关于我们的页面。</p>

<h2>联系我们：</h2>

<p>邮箱：example@email.com</p>

<p>电话：123-456-7890</p>

<h2>办公时间：</h2>

<p>周一至周五：9:00-18:00</p>

{% endblock %}

效果示例：

  

1.3.7 HTML实践作业

📝 任务要求: 创建个人学习笔记页面

请使用Flask创建一个关于Web开发学习的个人笔记页面。页面需包含以下所有元素：

1\. 不少于3个路由，且必须包含动态路由；

2\. 不少于3个HTML页面，必须包括默认页面，且不少于10种标签，页面之间能相互跳转，页面中必须包括超链接、图片、title等标签；

3\. 需要使用到Flask重定向功能；

4\. 需要使用到Flask模板继承功能。

1.4 Git工具

Git是一个开源的分布式代码、文档管理系统，常用于团队协作，本实验用通过Git获取实验代码。它通过记录文件快照的方式来追踪项目内容的变更，允许开发者在本地拥有完整的代码仓库和历史记录，从而支持灵活的离线工作、高效的分支创建与合并，是现代软件开发中不可或缺的协作与版本管理工具。

下载地址：https://git-scm.com/

  

  

  

双击Git-2.52.0.-64-bit.exe，都选择默认点击下一步就行。

  

  

  

  

  

  

  

安装完成后，在任意文件夹中的空白位置，可以看到鼠标右键菜单增加了两个关于Git的选项。

同时，Git指令已被加入环境变量，可在任意终端被识别。点击 Open Git Bash here。

  

在Git Bash中可执行linux相关命令，也就是说在Windows上通过Git Bash能实现执行Linux的效果。例如下面的id（查看用户和组信息）命令原本只能在Linux/Unix 系统上执行。

  

除了通过点击Open Git Bash here，还可以在CMD中直接Git命令进行操作，使用Git克隆Github或Gitee（中国版Github）中的项目：

\# git clone https://<项目名称>.git

例如: 使用Git克隆Github中一个叫flask的项目。

  

由于当前执行命令的路径是C:\\，所以下载完成后在C:\\中就能看到flask的文件夹。

  

1.5 从DataCon竞赛平台获取实验所需云服务器

DataCon是由清华大学和奇安信联合发起的面向高校学生和数据安全分析爱好者的专业数据安全竞赛社区。本次活动学生所需使用的服务器通过DataCon平台获取、管理。

1.6.1 平台注册

平台地址：https://www.datacon.org.cn/

首页：接受必需项，点击注册，进行账号注册。

  

注册方式支持：手机号注册，邮箱注册。

输入账号名，密码，手机号验证码，即可注册账号。同时也支持邮箱注册，点击邮箱注册可以进行切换。

  

注册成功后，使用注册账号，登录平台。

1.6.2 报名赛事

点击所有赛事，查看待参与赛事。

选择参与赛事：以现场公布的赛事名称为准。

通过报名连接，也可以直接访问赛事报名页面

报名链接以最新公布为准。

点击立即报名，进入战队信息填写弹窗

战队名称，战队logo为必填。其他字段，可根据实际情况进行填写。报名成功后，在页面即可见自己的战队。

  

  

1.6.3 赛事系统

比赛开始后，即可在赛事系统中，题目的描述里，查看到自己分配到的云服务器地址。

具体操作如下：

1\. 点击【进入比赛】

  

2\. 在赛事系统页点击赛题解答

  

3\. 进入赛题解答页后，点击赛题，弹出赛题弹框

  

4\. 出现赛题弹框后，点击赛题解答，进入赛题解答页面

  

5\. 点击打开虚拟环境，获取虚拟环境，这个过程可能页面需要加载一分钟，出现终端样式时，加载成功。

  

6\. 点击页面ssh按钮，可以查看云服务器的IP地址，连接账号，连接密码，通过终端进行云服务器连接

  

  

  

7\. 虚拟环境操作页，支持重启，关机云服务器，点击上方的重启，关机，重置登录密码。

  

1.6 阿里云服务器购买

阿里云服务器（ECS，Elastic Compute Service）是阿里巴巴集团旗下阿里云提供的核心云计算服务之一，它是一种安全可靠、弹性可伸缩的云端虚拟服务器。用户可以根据业务需求灵活选择CPU、内存、操作系统和网络配置，并实现分钟级快速部署与按需付费，有效降低IT成本。ECS不仅提供高性能计算能力、多种实例规格和丰富的镜像选择，还集成了云硬盘、安全组、快照备份等企业级功能，广泛应用于网站搭建、应用开发、数据处理、企业服务等高可用、高弹性的计算场景，是企业与开发者上云实现数字化转型的基础设施支撑。

本次课程中服务器是直接由DataCon平台提供，实验结束后即失效。本次活动结束后学生如果想要维持网站长期使用，可自行购买云服务器，访问阿里云官网（https://www.aliyun.com/），登录账号后，在控制台页面中选择“产品与服务”下的“云服务器ECS”。在ECS页面中，点击“立即购买”按钮，进入购买页面。注：除了阿里云还有腾讯云等公有云平台，完成学生认证后通常可享受优惠,如有需求可自行进一步了解。

  

根据自身需求购买对应的项目。

  

2 域名配置

域名就像是互联网上的“门牌号”或“地址簿”，它的功能是将复杂难记的IP地址（如192.168.1.1）转换为简单易懂的英文单词组合（如baidu.com），方便人们快速访问网站。它的核心作用是建立用户与网站服务器之间的桥梁，确保用户输入域名后能准确找到对应的网络资源。同时，域名还承载着品牌标识、专业形象和信任度，是企业或个人在数字世界中的重要身份象征。

  

2.1 域名注册

NameSilo是一家在国际上广受好评的域名注册商，其核心吸引力在于价格长期稳定透明、无隐藏费用，并且坚持为绝大多数域名免费提供终身WHOIS隐私保护，免去了用户额外的订阅成本与信息泄露的担忧。平台界面设计直观简洁，专注于提供域名注册、管理和转让等核心服务，操作体验流畅高效。凭借高性价比和可靠的客户支持，NameSilo成为了个人开发者、初创企业及注重隐私与预算的用户的首选注册商之一。

官方网站：https://www.namesilo.com

2.1.1 用户注册

  

注册：https://www.namesilo.com/sign-up?redirect=%2F

  

2.1.2 域名挑选

选择不同的域名和后缀，会有不同的价格，作为实验使用，建议限制价格在3美元以下，如挑选的域名关键词价格都比较高的情况下，建议选择其它关键词再次搜索。

注意：本实验手册中，将以0xse.cc作为演示，学生在实验操作中，请替换为自己的域名。

  

2.1.3 域名支付

  

  

点击更多选项，在更多选项中选择支付宝支付。

  

  

  

请记录以下信息：

域名

价格（元）

付款人

2.2 域名解析配置

域名解析配置，本质上是为你的域名（如 example.com）在互联网“电话簿”（即DNS系统）中设置对应的联系地址。因为互联网上的所有服务器和设备最终都通过一串数字形式的IP地址（如 192.0.2.1）来互相定位和通信，而人类难以记忆这些数字。所以，我们需要将便于记忆的域名“翻译”成机器能识别的IP地址，这个过程就是域名解析。通过配置解析记录，当用户访问你的域名时，DNS系统就能准确地将他们引导至存放你网站内容的目标服务器，从而实现网站的访问。

2.2.1 域名管理

进入域名管理页面：https://www.namesilo.com/account\_domains.php。

  

初次配置域名信息需要进行邮箱验证。

https://www.namesilo.com/account\_contacts\_email\_verification.php

  

在注册时填写的邮箱中，点击连接并输入验证码。

  

  

2.2.2 IP地址解析

进入配置页面，将默认的IP替换为自己阿里云服务器的IP地址，本实验手册中将以 8.217.110.77为例，学生在实验中请替换为自己分配到的IP，后续可参考 1.5 章节自行购买阿里云服务器进行绑定。

  

提交配置后一般需要10分钟时间生效，有时可能需要更久。

2.2.3 域名配置生效检测

Windows上：

在cmd终端输入nslookup指令：如果能正确返回IP地址则说明上面的配置已经生效。

\# nslookup <自己注册的域名>

  

Linux上：

使用dig命令查询域名解析结果。

\# dig <自己注册的域名>

  

使用在线检测平台：https://toolbox.googleapps.com/apps/dig/#A/

  

2.3 DNS缓存清理

清理DNS缓存是为了确保在测试域名解析时，能够获取到最新、最准确的DNS记录，而不是之前缓存的旧数据。 当我们修改DNS配置（如更换服务器IP、调整CDN设置或修复解析问题）后，旧的DNS记录可能仍被浏览器、操作系统或网络设备缓存着，导致测试时看到的是过时的结果，无法验证更改是否真正生效。只有清理了这些多级缓存（包括浏览器缓存、系统缓存、路由器缓存等），才能强制系统重新向DNS服务器查询，从而获得真实的解析结果，确保测试的有效性和问题的准确排查。

2.3.1 缓存层次机构

┌───────────────────────────────┐

│ 浏览器DNS缓存 │ ← 第一级（最快过期）

├───────────────────────────────┤

│ 操作系统DNS缓存（系统级） │ ← 第二级

├───────────────────────────────┤

│ 路由器/本地DNS服务器缓存 │ ← 第三级（影响局域网）

├───────────────────────────────┤

│ ISP（网络提供商）DNS缓存 │ ← 第四级（TTL较长）

├───────────────────────────────┤

│ 公共DNS服务器缓存（如8.8.8.8） │ ← 第五级

├───────────────────────────────┤

│ 权威DNS服务器 │ ← 最终来源

└───────────────────────────────┘

需要注意：浏览器应用程序（如Chrome、Firefox）有自己的DNS缓存，单单清空系统缓存不影响它们，如果需要清空浏览器缓存，需要在浏览器设置中单独操作。

作为当前实验学生，我们只有权力改动本地浏览器缓存和操作系统缓存。虽然我们能在域名配置中修改具体的TTL（Time To Live，生存时间），但是有的平台会有最低门槛设定，如当前使用的Namesilo平台最小TTL为3600秒。以及如果设置极短的TTL时，中间DNS缓存系统（网络提供商、公共DNS服务器）可能不遵守设定的较小TTL值，而是替换为它们认为合理的最小值。

2.3.2 Windows系统缓存清理

按 Win + R，输入 cmd，回车：

  

使用以下命令清理系统DNS缓存记录，看到“成功刷新DNS解析缓存”提示即完成。

\# ipconfig /flushdns

  

2.3.3 Linux系统缓存清理

使用以下命令清理系统DNS缓存记录，看到“Current Cache Size: 0”提示即完成。

\# resolvectl flush-caches

\# resolvectl statistics

  

2.3.4 Chromium内核浏览器

Chrome / Edge（Chromium内核）通过地址栏

在地址栏输入并访问：chrome://net-internals/#dns

点击 "Clear host cache" 按钮

额外步骤：还需要清除Socket池

在地址栏输入：chrome://net-internals/#sockets

点击 "Flush socket pools"

  

2.3.5 Firefox浏览器

Firefox通过配置页面

在地址栏输入并访问：about:config

搜索 network.dnsCacheExpiration

双击将值临时改为 0（清空后建议改回默认值60）

或者搜索 network.dnsCacheEntries，设为 0

  

2.3.6 Safari (MacOS)

打开Safari，点击菜单栏 Safari > 偏好设置

进入 "高级" 选项卡

勾选 "在菜单栏中显示开发菜单"

从菜单栏选择 "开发" > "清空缓存"

3 网站搭建

将代码部署到公网上是为了构建一个可公开访问、持续运行的真实应用环境。在本地开发时，应用仅能在个人设备上运行和测试，功能与性能受本地资源限制，且无法模拟多用户并发访问、真实网络延迟及跨设备兼容性等实际场景。部署至阿里云服务器后，学生能够获得一个稳定的线上运行环境，便于通过任意网络和设备随时访问和测试项目功能，也为后续集成更复杂的数据处理、用户交互及扩展服务提供了必要的实践基础，使学习过程更贴近实际生产部署流程。

在前面的Flask学习课程已经详细的介绍了Flask的基础知识，本模块将会直接提供本课程实验的项目代码，学生需要部署到自己的阿里云服务器上方可进行后续课程内容（口令安全、AI安全）。

项目地址：https://gitee.com/xsecc/qhfz

3.1 服务器上部署项目代码

提供以下三种方法：Git克隆、VS Code上传、SCP远程传输。

3.1.1 Git克隆（推荐）

直接在服务器上使用Git克隆Github项目：

https://gitee.com/xsecc/qhfz.git

  

3.1.2 VS Code上传

可先将项目下载到本地，然后通过在VS Code中拖拽方式，将项目代码上传到服务器指定位置。

访问：https://gitee.com/xsecc/qhfz

  

  

  

3.1.3 SCP远程传输

SCP（Secure Copy Protocol） 是一个基于 SSH 的安全文件传输协议，用于在本地计算机和远程服务器之间，或者两个远程服务器之间安全地复制文件。

\# scp -r < folder\_name> <username>@<server\_ip>:<path>

输入密码：

  

3.2 服务器安装Flask

因为Flask本身是一个Python第三方库，而不是操作系统内置的可执行程序。当我们将开发好的Flask应用代码从本地计算机迁移到全新的服务器时，该服务器默认只有纯净的Python环境，并不包含项目所依赖的Flask库及其相关组件。如果在服务器上直接运行包含import flask的代码，Python解释器会因为找不到这个模块而报错、无法启动应用。因此，必须通过pip install flask等命令在服务器上安装完全相同的Flask环境，才能为应用程序提供运行所需的依赖支持，这和我们在本地开发时第一步要安装Flask是同一个道理。

服务器已经部署python3和pip，可直接使用pip进行安装。

\# pip install flask

  

3.3 启动网站

将开发完成的网站代码部署并运行在服务器上，使其成为一个可以通过网络访问的在线服务。其根本目的是将静态代码或本地应用转化为一个持续对外提供服务的公共端点，以便用户、测试人员或相关系统能够通过浏览器或API进行访问与交互。这不仅是为了完成功能验证和调试（常采用“临时运行”方式），更是为了实现服务的稳定、可靠与持久可用，从而支撑真实世界的业务需求。为此，在正式生产环境中，必须使用持久化运行方案（如Tmux会话守护、系统服务封装或容器化部署），确保服务器进程不会因终端断开而中断，以保障服务的连续性与可靠性。

3.3.1 临时运行

一般在调试和测试版中，为方便查看与验证，选择临时运行的方式，这种方式的问题在于一旦断开终端连接，运行的服务器也就会中断。

在前面案例中就是使用的临时运行，但要想持久对外提供服务还行额外操作。

  

3.3.2 持久化运行

Tmux（Terminal Multiplexer）是一款终端复用软件，它允许你在一个终端窗口中创建、管理和切换多个持久化的虚拟终端会话。即使关闭SSH连接或终端窗口，会话仍在后台运行，随时可重新接入。它的核心功能包括分屏（将窗口划分为多个窗格）、会话管理（保存工作环境）和窗口标签（像浏览器标签页一样管理多个终端任务），特别适合远程服务器开发、运维和需要长时间运行任务的后台场景。

Tmux常见使用命令如下，更多用法请自行了解。

tmux new -s <sessionname>　创建名为sessionname（可自定义）的会话

tmux ls　显示会话列表

tmux a　　连接上一个会话

tmux a -t <sessionname>　连接指定会话

tmux rename -t s1 s2　　重命名会话s1为s2

tmux kill-session　　关闭上次打开的会话

tmux kill-session -t s1　　关闭会话s1

tmux kill-session -a -t s1　　关闭除s1外的所有会话

tmux kill-server　　关闭所有会话

常用快捷键:

Ctrl+b d 离开当前会话（最常用，相当于最小化）

Ctrl+b x 删除当前会话（最常用，相当于关闭）

Ctrl+b s 列出会话，可进行切换

Ctrl+b a -t number 其中number是 tmux ls 获取的序列号 从0 开始

使用举例：

前期已将项目上传至服务器的 /root/QHFZ 路径下，接下来在该路径中创建Tmux新会话，并设定会话名称，假设新的会话名称叫 “QHFZ”：

\# tmux new -s QHFZ

  

在该会话中运行python3 app.py

  

退出当前会话时，快捷键：先按Ctrl+b，后按 d

为增加Tmux演示效果，可额外再创建一个叫 “TEST”的会话。

查看当前系统运行的Tmux会话列表：

\# tmux ls

  

可以看到当前系统中存在两个刚才创建的Tmux会话： QHFZ和TEST。下面以终止 QHFZ 会话为例，演示如何销毁创建的Tmux会话。

\# tmux kill-session -t TEST

  

3.4 Nginx配置

Nginx是一款高性能的Web服务器和反向代理服务器软件，其核心作用是高效、稳定地处理网络访问请求。它可以直接托管网站文件（如HTML、图片），响应用户的浏览器访问；更重要的是，它常作为“智能交通调度员”，充当反向代理，接收用户请求后，将其转发给后端的多个应用服务器（如Java、Python程序），并将结果返回给用户，从而实现负载均衡、提升并发处理能力与系统安全性。同时，Nginx还能提供缓存加速、SSL/TLS加密（HTTPS）等关键功能，是现代网络架构中至关重要的基础组件。

  

3.4.1 Nginx安装

查看当前可安装nginx版本

\# apt list –a nginx

Nginx安装

\# apt install nginx –y

查看nginx安装版本

\# nginx -V

验证ssl模块

\# nginx -V 2>&1 | grep -- '--with-http\_ssl\_module'

  

3.4.2 Nginx配置验证与生效

验证Nginx是否存在配置方面的语法错误。

\# nginx –t

  

重新加载Nginx配置项。

\# nginx –s reload

  

如果加载nginx配置文件失败，可尝试重启Nginx服务

\# systemctl restart nginx

  

3.4.3 Nginx默认页面

Nginx默认使用80端口，若80端口已被占用则会启动失败，成功启动后，直接访问就能看到Nginx的默认页面。

  

3.4 HTTPS配置

HTTPS 是在 HTTP 协议基础上，通过加入 SSL/TLS 加密层 来实现安全通信的网络协议。它的核心作用是在客户端（如浏览器）和服务器之间建立一个加密通道，对传输的数据进行加密和完整性保护，有效防止窃听、篡改和中间人攻击；同时通过数字证书进行身份认证，确保用户访问的是真实、可信的服务器（而非钓鱼网站）。这使得 HTTPS 成为当今网站保障用户隐私和数据安全（如登录凭证、支付信息）的基础性安全标准，也是浏览器标识网站可信度的关键指标（地址栏显示锁形图标）。

3.4.1 Certbot安装

Certbot 是一个免费、开源的自动化工具，主要作用是为网站自动获取、部署和续期 Let's Encrypt 颁发的 SSL/TLS 证书，从而将网站的 HTTP 连接升级为加密的 HTTPS 连接，保障数据传输安全。它通过简化的命令行交互，自动完成域名验证（如 DNS 或 HTTP 挑战）、证书申请、Web 服务器（如 Nginx、Apache）配置更新等复杂流程，并内置定时任务自动续期证书，彻底解决了传统 SSL 证书昂贵、手动操作繁琐和易过期的问题，是推行全站 HTTPS 的标配工具。

在安装Certbot前需要更新apt，避免本地apt包中没有Certbot。

\# apt update

安装certbot工具。

\# apt install certbot -y

通过查看安装版本确认certbot是否安装成功。

\# certbot --version

  

3.4.2 SSL/TLS证书申请

方式一：

手动模式申请证书，注意，本书中出现的0xse.cc域名为演示域名，学生在实际操作时需要更换为自己购买的域名。

\# certbot certonly --manual --preferred-challenges=dns -d "www.0xse.cc" --server https://acme-v02.api.letsencrypt.org/directory

  

注意!!!：当看到出现挑战码时先不要按回车健。此时需要在域名管理平台发布相应的内容。

从这个提示信息中能看得出来，需要将 \_acme-challenge.www.0xse.cc的DNS TXT记录配置为：ZDQ2aL1lOXXu9NTULvh2wayC\_BWDh\_IDjpgNmRY-K

此时需要回到域名配置页面

https://www.namesilo.com/account\_domains.php。

  

根据提示要求，新增DNS记录，类型选择TXT，名称填写 \_acme-challenge.www,文本内容写入指定值：

ZDQ2aL1lOXXu9NTULvh2wayC\_BWDh\_IDjpgNmRY-K

点击提交。注意，学生在操作这一步时需根据自己的实际值进行填写。

  

提交发布后，还需要持续等待约10分钟左右使配置记录能在全球生效，等待过程中，可在本机进行测试。

\# 通过以下3种方式查看\_acme-challenge是否更新

\# nslookup -type=txt \_acme-challenge.www.0xse.cc

\# dig \_acme-challenge.www.0xse.cc TXT

https://toolbox.googleapps.com/apps/dig/#TXT/\_acme-challenge.www.0xse.cc注意：www.0xse.cc为示例域名，实际操作中请使用自己申请的域名。

  

本过程中，可能受到本地DNS缓存记录影响，导致刷新后未获得最新记录，可参考2.3 DNS缓存清理 进行清理缓存。

当检测到TXT记录生效后方可按回车按钮继续完成证书申请，此过程中一旦申请失败可申请其他子域名。因为即使再次申请相同域名的证书，每次的挑战码都不一致，重新提交挑战码后，旧的挑战码短期内依旧未在互联网中被彻底更新，需要等待很久的时间才是彻底更新完。

  

此时可以看到成功申请到的证书保存地址为：/etc/letsencrypt/live/<申请域名>文件夹下，其中privkey.pem是私钥文件，fullchain.pem是完整证书链文件，它包含了公钥，但不仅仅是公钥。

注：如果方式一短期难以完成，可通过方式二尝试。

方式二：

Standalone 模式是 Certbot 的一种工作模式，它会临时启动一个内置的 Web 服务器来处理 Let's Encrypt 的验证挑战。

工作原理：

Certbot 自动启动一个临时的 Web 服务器，监听 80 端口（HTTP-01 挑战）或 443 端口（TLS-ALPN-01 挑战），专门用于响应 Let's Encrypt 的验证请求。自动处理挑战文件，在内存中创建验证文件，Let's Encrypt 访问 http://你的域名:80/.well-known/acme-challenge/xxx，Certbot 的临时服务器直接响应，验证完成后自动关闭。获取证书后，临时服务器自动停止，不会影响你原有的 Web 服务器。

这里以oa.0xse.cc为例，演示方式二。注意：oa.0xse.cc为示例域名，实际操作中请使用自己申请的域名。

  

由于Standalone 模式会占用本地80端口和已安装的Nginx会产生冲突。

先停止Nginx，解除本地80端口的占用。

\# systemctl stop nginx

\# certbot certonly --standalone -d oa.0xse.cc

注意：申请证书完毕后记得重新启动Nginx。

\# systemctl start nginx

3.4.3 流量转发与代理

编辑Nginx 配置文件，现实先将访问本地80端口的HTTP流量转发到443端口的HTTPS上，并使用代理将流量传输到真正的Web服务器（Flask系统的8080端口）上。

这里推荐使用Nano编辑器，常用的快捷键有：

Ctrl + S 保存

Ctrl + K 删除整行

Ctrl + X 退出

使用Nano编辑器，按键盘方向键定位光标，通过键盘输入内容或通过鼠标右键粘贴。

注意：www.0xse.cc为示例域名，实际操作中请使用自己申请的域名。

\# nano /etc/nginx/sites-available/default

server {

listen 80;

listen \[::\]:80;

server\_name www.0xse.cc;

\# HTTP 到 HTTPS 重定向

location / {

return 301 https://www.0xse.cc$request\_uri;

}

}

server {

listen 443 ssl;

listen \[::\]:443 ssl;

server\_name www.0xse.cc;

\# SSL 配置

ssl\_certificate /etc/letsencrypt/live/www.0xse.cc/fullchain.pem;

ssl\_certificate\_key /etc/letsencrypt/live/www.0xse.cc/privkey.pem;

\# SSL 协议和加密套件（安全推荐）

ssl\_protocols TLSv1.2 TLSv1.3;

ssl\_ciphers HIGH:!aNULL:!MD5;

\# 其他配置保持不变

root /var/www/html;

index index.html index.htm index.nginx-debian.html;

\# 反向代理配置

location / {

\# 实验课程中的Flask是运行在8080端口

proxy\_pass http://127.0.0.1:8080;

}

}

验证Nginx配置语法无误后，重新加载Nginx配置项。

  

3.4.4 HTTPS证书验证

在浏览器上访问自己申请的域名，本手册中以www.0xse.cc为例。

以下是Chrom浏览器访问实验网站示意图：

  

  

  

以下是Edge浏览器访问实验网站示意图：

  

  

  

其他类型浏览器查看证书也是点击地址前面的安全标志符号，过程可能略有不同。

3.5 博客网站搭建

Hugo 是一个用 Go 语言编写的现代化静态网站生成器，它能将简洁的 Markdown 文本文件与模板主题相结合，闪电般地生成完整的静态 HTML 网站。它无需数据库或复杂的运行环境，让你专注于内容创作，只需简单编写.md 文档，Hugo 便能自动解析结构、应用布局样式，并输出一套可部署于任何 Web 服务器的轻量级静态文件，是构建博客、文档站或企业官网的高效利器。

3.5.1 Hugo安装

官网地址：https://gohugo.io/

  

在Github上下载hugo可执行文件。

访问：https://github.com/gohugoio/hugo

  

注意!!!,这里选择扩展版（带extended），普通版无法使用第三方主题代码。

  

  

解压该zip压缩包文件，这里以

C:\\hugo\_extended\_0.154.3\_windows-amd64\\ 为例。

  

为在系统任何路径中都能使用到hugo.exe，这里将hugo.exe添加到电脑的系统环境变量中。按win+R 键 输入 sysdm.cpl打开 系统属性。

  

  

选择编辑 系统变量 中的 Path。

  

添加hugo.exe所在的文件路径：

C:\\hugo\_extended\_0.154.3\_windows-amd64\\

  

  

  

3.5.2 创建网站

在CMD命令行中，进入要放置网站的目录，本书以C:\\hugo\_extended\_0.154.3\_windows-amd64\\ 为例，学生请根据自身放置Hugo路径为主，然后运行下面命令创建博客项目文件夹：

\# hugo.exe new site <博客名称>这里以myblog作为博客名为例，学生实际操作中请根据自身情况决定。

  

创建后能看到出现myblog的文件夹。

  

进入myblog文件夹，可以看到基本的项目框架结构如下：

  

hugo.toml 是网站的主配置文件，定义了站点标题、主题、URL等基本设置；archetypes 存放内容模板，用于快速生成具有预设Front Matter的Markdown文件；assets 包含CSS、JavaScript等需要处理的资源文件；content 是网站的核心，所有Markdown格式的文章和页面都存储在这里；data 存放YAML、JSON或TOML格式的配置文件，用于存储全局数据；i18n 存放国际化翻译文件，支持多语言网站；layouts 包含HTML模板文件，控制页面的结构和布局；static 存放直接复制到最终站点的静态文件，如图片、字体和不需要处理的文件；themes 则存放网站主题，包含预设的布局和样式，用户可以选择或自定义主题来改变网站外观。

3.5.3 添加主题

以当前文件路径C:\\hugo\_extended\_0.154.3\_windows-amd64\\ 为例，初始化Git仓库。

\# git init

  

也可使用绝对路径初始化Git仓库，Hugo安装在D盘中。

以D:\\hugo\_extended\_0.154.5\_windows-amd64为例进行初始化Git仓库。

\# git init "D:\\hugo\_extended\_0.154.5\_windows-amd64"

安装主题

方式1：远程命令安装

这里以ananke主题为例，学生可自行选择其他主题，进入刚才创建的myblog文件夹中执行下面命令：

\# git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke

  

当然也可在Gitee中尝试获取，在Gitee官网中搜索：https://so.gitee.com/

  

方式2：手动安装

使用浏览器访问：

https://github.com/theNewDynamic/gohugo-theme-ananke

  

找到最新的版本（如 v2.12.1），点击 Source code (zip) 或类似的压缩包链接进行下载。

  

在myblog\\themes\\ 中，新建名为 ananke 的文件夹，将解压后的文件夹里的所有内容（通常是 archetypes, layouts, README.md 等），都复制到刚刚创建的 myblog\\themes\\ananke\\ 文件夹中。

  

完成后，myblog目录结构应该大致如下：

myblog/

├── themes/

│ └── ananke/ <-- 这是你新建的文件夹

│ ├── layouts/ <-- 主题的核心模板文件应该在这里

│ ├── static/

│ └── theme.toml <-- 主题的配置文件

├── content/

├── hugo.toml

└──...

3.5.4 配置与试运行

打开网站根目录下的 hugo.toml文件，添加启用的主题配置，以及要部署网站的域名和路径：

  

  

最后，在myblog目录中启动本地服务：

\# hugo.exe server

  

当只配置hugo.toml 时，Hugo会使用主题自带的演示效果,如下图所示：

http://localhost:1313/myblog/

  

3.5.5 Hugo目录结构

以接下来使用到的案例为例，Hugo的目录结构主要由以下组成。

myblog/

├── hugo.toml # 配置文件

├── themes/ # 主题目录

├── static/ # 静态文件目录

│ └── images/ # 图片目录

│ └── hugo-logo.png # 图片文件

└── content/ # 内容目录

├── posts/ # 文章目录

│ ├── Hugo快速入门.md # 内容：categories: \["网站搭建"\]

│ ├── 密码安全基础.md # 内容：categories: \["口令安全"\]

│ └── ai安全入门.md # 内容：categories: \["AI安全"\]

├── categories/ # 分类目录

│ └── \_index.md # 分类文件！

└── tags/ # 标签目录

└── \_index.md # 标签文件！

hugo.toml 是Hugo网站的全局配置文件，它启用和配置网站的各类功能。通过在文件中设置\[taxonomies\] category = "categories"来激活分类系统，定义网站的基础参数如标题、主题、URL结构等，并控制所有页面的生成规则和显示方式。

categories是分类系统的展示层，具体表现为content/categories/\_index.md文件及其自动生成的页面。它负责创建分类导航界面，自动聚合所有标记了分类的文章，为每个分类生成独立的列表页面，并提供用户浏览分类内容的入口路径。

tags 是标签系统的展示层，具体表现为 content/tags/\_index.md 文件及其自动生成的页面。它负责创建标签导航界面，自动聚合所有标记了标签的文章，为每个标签生成独立的列表页面，并提供用户通过关键词浏览内容的入口路径。

<文章>.md 是具体的内容文档，位于content/posts/ 目录下。它在文档的YAML头部通过categories: \["分类名"\]字段声明所属分类，当Hugo生成网站时，系统会根据这个声明自动将文章归入对应的分类页面中，同时生成独立的文章浏览页面。

可以把这四者比作图书馆管理系统：hugo.toml 是图书馆馆长，他既规定图书必须按学科分类上架（categories），也要求为每本书建立详细的关键词索引卡（tags）；categories 是图书分类目录牌，展示“计算机类”“文学类”等固定分类标识；tags 则是贴在每本书上的关键词索引卡，记录“Python”“悬疑”“2023出版”等具体主题与属性；而文章.md 就是一本具体图书，它被放在“计算机类”书架上（categories），同时书内附有“Python”和“入门教程”等多张索引卡（tags）。这样，读者既可以通过分类目录牌查找一个大类的图书，也能通过关键词索引卡快速找到所有关联主题的书籍，无论它们属于哪个主分类。

3.5.6 创建博客

接下来使用Hugo工具搭建一个结构清晰、目的明确、专注于学习笔记的博客。

第一步：规划内容结构（分类）

首先，我们来规划知识体系。假如，网站内容分为三个页面：Hugo快速入门、密码安全基础、AI安全入门。

首先，通过hugo.toml设置整体样式，设置网页标题、主题、菜单栏等。修改hugo.toml为：

baseURL = 'https://www.0xse.cc/myblog/'

languageCode = 'zh-cn'

title = '我的博客'

theme = 'ananke'

\# 添加分类配置

\[taxonomies\]

category = "categories" # 重要！

tag = "tags" # 重要！

\# 菜单配置（可选，但建议添加）

\[menu\]

\[\[menu.main\]\]

name = "🏠 首页"

url = "/"

weight = 1

\[\[menu.main\]\]

name = "📂 分类"

url = "/categories/"

weight = 2

\[\[menu.main\]\]

name = "🏷️ 标签"

url = "/tags/"

weight = 3

\# 分页设置

\[pagination\]

pageSize = 10

浏览器访问博客网站，可以看到通过配置hugo.toml，已经改变了默认页面的内容。

http://localhost:1313/myblog/

  

其次，为了对文章进行统一管理和快速定位，继续增加分类和标签管理。

在 myblog/content/ 目录下，创建核心分类文件。

在 myblog 目录下执行：

\# hugo.exe new content categories/\_index.md

  

编辑content/categories/\_index.md

\---

title: "📂 文章分类"

type: "categories"

\---

这里是所有文章的分类列表。点击分类名称查看该分类下的所有文章。

浏览器访问：http://localhost:1313/myblog/categories/，因为还没创建具体的文章，此时还不会出现归类的文章。

  

编辑content/tags/\_index.md

\---

title: "🏷️ 文章标签"

type: "tags"

\---

这里是所有文章的标签列表。点击标签查看该标签下的所有文章。

浏览器访问：http://localhost:1313/myblog/tags/，因为还没创建具体的文章，此时也不会出现归类的标签。

  

第二步：创建博客文章

文章1：Hugo快速入门

\# hugo.exe new content posts/Hugo快速入门.md

  

编辑网站搭建相关文章，注意文章1里面有个配置图片的案例，需要学生在static文件夹中建立一个images文件夹，然后在images文件夹中保存一张名为hugo-logo.png的图片。

  

文章1：Hugo入门教程 (content/posts/Hugo快速入门.md)

\---

title: "Hugo静态网站快速入门指南"

date: 2026-01-10

categories: \["网站搭建"\]

tags: \["hugo", "静态网站", "教程", "入门"\]

description: "从零开始学习使用Hugo搭建个人博客"

featured\_image: "/images/hugo-logo.png"

draft: false

\---

\## 一、Hugo简介

Hugo是一个用Go语言编写的静态网站生成器，以其\*\*速度快\*\*和\*\*简单易用\*\*而闻名。

\### 主要特点

\- ⚡ \*\*极速生成\*\*：生成上千页面只需几秒钟

\- 📝 \*\*Markdown支持\*\*：使用简单的Markdown语法写作

\- 🎨 \*\*主题丰富\*\*：大量开源主题可供选择

\- 🔧 \*\*配置简单\*\*：单个配置文件管理所有设置

\## 二、安装Hugo

\### Windows系统

1\. 访问Hugo GitHub Releases页面

2\. 下载 \`hugo\_extended\_xxx\_windows-amd64.zip\`

3\. 解压得到 \`hugo.exe\` 文件

4\. 放到项目目录或添加到系统PATH

\### 验证安装

./hugo.exe version

\# 显示：hugo v0.154.3+extended

文章2：密码安全基础

\# hugo.exe new content posts/密码安全基础.md

  

\---

title: "密码安全基础"

date: 2026-01-10

categories: \["口令安全"\]

tags: \["密码学", "安全", "加密"\]

description: "了解密码学基础和个人密码管理"

draft: false

\---

\## 一、密码安全重要性

密码是保护数字身份的第一道防线。弱密码会导致隐私泄露和财产损失。

\## 二、密码学基础

\### 1. 哈希函数

\- 单向加密，不可逆

\- 相同输入永远输出相同结果

\- 常见算法：SHA-256、bcrypt

\### 2. 对称加密

\- 同一个密钥加密和解密

\- 常用算法：AES

\- 适用于文件加密

\### 3. 非对称加密

\- 公钥加密，私钥解密

\- 常用算法：RSA、ECC

\- 用于SSL证书、数字签名

\## 三、密码存储安全

\### 禁止的做法

\- 明文存储密码

\- 使用MD5等弱哈希

\- 可逆加密存储

\### 正确做法

\- 加盐哈希存储

\- 使用bcrypt、Argon2等强算法

\- 每个用户不同盐值

\## 四、个人密码管理

\### 强密码规则

\- 至少12位字符

\- 混合大小写、数字、符号

\- 不要用常见词汇

\### 密码工具

\- 密码管理器：Bitwarden、1Password

\- 启用双因素认证

\- 定期更换重要密码

文章3：AI安全入门

\# hugo.exe new content posts/AI安全入门.md

  

\---

title: "AI安全入门"

date: 2026-01-10

categories: \["AI安全"\]

tags: \["人工智能", "机器学习", "安全"\]

description: "了解AI系统面临的安全威胁和防护方法"

draft: false

\---

\# AI安全入门

\## 一、AI安全概述

AI系统面临独特的安全威胁，需要专门防护。

\## 二、主要安全威胁

\### 1. 对抗样本攻击

\- 添加微小扰动误导AI判断

\- 导致错误分类

\- 防御：对抗训练

\### 2. 数据投毒

\- 污染训练数据

\- 影响模型性能

\- 防御：数据清洗

\### 3. 模型窃取

\- 通过API查询复制模型

\- 盗取知识产权

\- 防御：查询限制

浏览器访问：http://localhost:1313/myblog/categories/，此时就能看到个各个类型的文章。

  

浏览器访问：http://localhost:1313/myblog/tags/，此时就能看到各个标签的文章。点击其中的"安全"标签。就能查看所有属于"安全"标签的文章。

  

  

也可逐个访问创建的3个文章页面，浏览器访问页面一：http://localhost:1313/myblog/posts/hugo快速入门/

  

浏览器访问页面二：http://localhost:1313/myblog/posts/密码安全基础/

  

浏览器访问页面三：http://localhost:1313/myblog/posts/ai安全入门/

  

第三步：本地生成HTML文件 public文件夹中保留的是实例化后的HTML文件以及依赖的其他静态文件。由于测试过程中可能会存在残留的旧文件，在最终使用时建议清空public文件夹。

\# rmdir /s public

  

也可直接手动清空。

重新生成public文件夹。

\# hugo.exe server

  

  

3.5.7 通过Nginx部署博客网站

通过3.1 上传网站代码提供的方法 将本地生成的public文件夹上传到服务器的Nginx Web路径（/usr/share/nginx/html/）下，并改名为myblog 。

  

使用以下命令修改/etc/nginx/sites-available/default的配置

nano /etc/nginx/sites-available/default

server {

listen 80;

listen \[::\]:80;

server\_name www.0xse.cc;

\# HTTP 到 HTTPS 重定向

location / {

return 301 https://www.0xse.cc$request\_uri;

}

}

server {

listen 443 ssl;

listen \[::\]:443 ssl;

server\_name www.0xse.cc;

\# SSL 配置

ssl\_certificate /etc/letsencrypt/live/www.0xse.cc/fullchain.pem;

ssl\_certificate\_key /etc/letsencrypt/live/www.0xse.cc/privkey.pem;

\# SSL 协议和加密套件（安全推荐）

ssl\_protocols TLSv1.2 TLSv1.3;

ssl\_ciphers HIGH:!aNULL:!MD5;

\# 其他配置保持不变

root /var/www/html;

index index.html index.htm index.nginx-debian.html;

\# /myblog/ 路径配置

location ^~ /myblog/ {

alias /usr/share/nginx/html/myblog/;

index index.html;

try\_files $uri $uri/ /myblog/index.html;

}

location = /myblog {

return 301 /myblog/;

}

\# 反向代理配置

location / {

proxy\_pass http://127.0.0.1:8080;

}

}

注意：www.0xse.cc为本手册的案例域名，学生实际操作中请替换为自己的域名。

验证Nginx配置语法是否正确，并使配置生效。

  

浏览器访问：https://www.0xse.cc/myblog/

  

3.5.8 搭建自己博客

📝任务要求：

通过上面简单案例，成功的在服务器上搭建了一个博客系统。请同学们根据自己的喜好风格，创建自己的博客。

要求：每天生成一篇学习笔记，并根据笔记内容进行分类，以及为笔记添加标签方便快速定位，可使用AI 美化自己博客的页面样式。

这份指导手册非常详尽，主要目的是指导初学者（如冬令营学生） **从零开始，在本地开发一个动态网站和一个静态博客，并将它们部署到互联网公网服务器上，同时配置域名和加密访问。**

这是一个非常经典的“全栈开发入门”流程。以下是它完成的核心任务总结，以及针对每个环节的简化建议。

### 一、 这些步骤主要完成了什么？

我们可以将这 100 多页的内容归纳为四个核心阶段：

#### 1\. 本地开发环境搭建 (Local Setup)

- **目标：** 让电脑能运行 Python 代码，能写代码，能管理代码版本。
- **动作：** 安装 Python、Pip、VS Code（及插件）、Git。
- **产出：** 一个可以运行 Flask（Python Web 框架）的本地环境。

#### 2\. 基础设施准备 (Infrastructure)

- **目标：** 在互联网上拥有一个“家”和“门牌号”。
- **动作：** 获取阿里云服务器（ECS/Ubuntu），购买域名（NameSilo），配置 DNS 解析（将域名指向服务器 IP）。
- **产出：** 一台公网可访问的 Linux 服务器，且可以通过域名找到它。

#### 3\. 动态网站部署与安全 (Deployment & Security)

- **目标：** 让本地写好的 Flask 网站在服务器上跑起来，并由“裸奔”的 HTTP 变为安全的 HTTPS。
- **动作：**
	- 代码同步（Git/SCP）。
	- 服务器环境配置（安装 Python/Flask）。
	- 持久化运行（使用 `tmux` 保持后台运行）。
	- 反向代理（安装 Nginx 转发流量）。
	- SSL 证书（使用 Certbot 申请 Let's Encrypt 证书）。
- **产出：** 一个可以通过 `https://www.xxx.com` 访问的动态 Web 应用。

#### 4\. 静态博客集成 (Static Site)

- **目标：** 搭建一个内容管理系统（CMS）来写文章。
- **动作：** 安装 Hugo，生成静态 HTML 文件，配置 Nginx 将特定路径（如 `/myblog` ）指向这些静态文件。
- **产出：** 一个功能完整的个人博客系统。

---

### 二、 可以进一步简化吗？

**答案是肯定的。** 这份手册采用的是 **最“原生”、最“底层” **的教学方式。这种方式的优点是能让学生理解 HTTP、服务器、端口、反向代理等原理，但缺点是** 步骤繁琐、容错率低、维护成本高** 。

如果目标是“快速上线”或“现代化开发”，可以通过以下几个维度大幅简化：

#### 方案 A：极致简化版（Serverless/PaaS 路线）

*适用场景：不需要管理服务器，只想专注写代码和内容。*

1. **省去购买和配置服务器、Nginx、Certbot、Tmux。**
2. **动态网站 (Flask)：** 使用 **Vercel** 、 **Render** 或 **Railway** 。
	- *操作：* 将代码上传到 GitHub，连接 Vercel，点击“Deploy”。它会自动安装依赖、分配 HTTPS 域名、自动扩容。
3. **静态博客 (Hugo)：** 使用 **GitHub Pages** 或 **Netlify** 。
	- *操作：* 将 Hugo 项目推送到 GitHub，开启 Pages 功能，自动构建并发布，无需本地生成 `public` 文件夹再上传。
4. **简化结果：** 步骤减少 80%，无需接触 Linux 命令和 SSH。

#### 方案 B：工具替代版（保持服务器，但简化运维）

*适用场景：必须使用云服务器（如比赛要求），但不想手写 Nginx 配置文件。*

1. **用 Caddy 替代 Nginx + Certbot**
	- *现状：* 手册中需要安装 Nginx，手写复杂的 `conf` 文件，再运行 Certbot 申请证书，还要配置定时续期。
	- *简化：* 使用 **Caddy Web Server** 。
	- *操作：* 只需要一行配置 `www.yourdomain.com { reverse_proxy 127.0.0.1:8080 }` 。Caddy 会 **自动** 申请、配置和续期 HTTPS 证书，全自动生效。
2. **用 Docker 替代 环境安装**
	- *现状：* 服务器上通过 `pip install` 安装依赖，容易版本冲突。
	- *简化：* 在本地写一个 `Dockerfile` ，服务器上直接 `docker run` 。保证环境 100% 一致，且易于管理。
3. **用 Process Manager 替代 Tmux**
	- *现状：* 用 `tmux` 挂后台，服务器重启后服务会挂掉。
	- *简化：* 使用 **Supervisor** 或 **Systemd** ，或者简单的 `pm2` (对 Python 支持也不错)。设置开机自启和崩溃重启。

#### 方案 C：流程优化版（针对手册中的具体痛点）

如果不改变技术栈，仅优化操作流程：

1. **VS Code Remote - SSH 直接开发：**
	- 手册中提到“本地写好 -> 拖拽/Git 上传 -> 服务器运行”。
	- *简化：* 直接用 VS Code 的 Remote SSH 插件连接服务器， **直接在服务器上写代码和调试** ，省去上传步骤，实时反馈。
2. **利用 GitHub Actions (CI/CD)：**
	- *简化：* 配置当你 `git push` 代码时，GitHub 自动把代码同步到服务器并重启服务，彻底告别手动 `git pull` 或 `scp` 。

### 总结对比

| 维度 | 原手册方案 (传统运维) | 简化方案 A (PaaS) | 简化方案 B (现代化运维) |
| --- | --- | --- | --- |
| **核心工具** | Linux, Nginx, manual Certbot | Vercel, Netlify | Docker, Caddy |
| **学习曲线** | 陡峭 (需懂 Linux/网络) | 极低 (会上传代码即可) | 中等 (需懂容器/配置) |
| **服务器成本** | 需购买云服务器 | 大部分免费 | 需购买云服务器 |
| **维护难度** | 高 (需手动续期、更新) | 零维护 | 低 (自动化程度高) |
| **适合人群** | **想深入理解计算机原理的学生** | **只想快速展示作品的用户** | **追求效率的开发者** |

**建议：** 如果是为了教学（让学生懂原理），原手册的流程虽然繁琐但很有必要。如果是为了让学生在比赛中 **更高效** 地完成任务，建议引入 **VS Code Remote 开发** 和 **Caddy 服务器** 这两个工具，能立竿见影地减少 50% 的环境配置报错。

你需要我针对具体的某个简化方案（比如怎么用 Caddy 替代 Nginx）提供详细步骤吗？

动态网站 (Flask)： 使用 Vercel、Render 或 Railway。

  

操作： 将代码上传到 GitHub，连接 Vercel，点击“Deploy”。它会自动安装依赖、分配 HTTPS 域名、自动扩容。

静态博客 (Hugo)： 使用 GitHub Pages 或 Netlify。

  

操作： 将 Hugo 项目推送到 GitHub，开启 Pages 功能，自动构建并发布，无需本地生成 public 文件夹再上传。

  

动态的话，相当于用的serverless的方案哈？静态的话怎么都好说。

  

从我给你的手册来看。其实flask也就是个熟悉？ 感觉完全没啥必要呢？不就是通过hugo打包了网页吗

你说得非常准， **简直是一针见血** 。

你对架构的直觉很敏锐：

1. **关于 Vercel/Render：** 没错，这就是典型的 **Serverless (无服务器)** 或 **PaaS (平台即服务)** 模式。你只管提交代码，底层怎么跑、扩容、HTTPS 证书全由平台托管，这完全不需要你自己去配置 Nginx、Linux 和 SSL。
2. **关于 Flask 是否必要：** 如果你的最终目标仅仅是“搞一个 Hugo 个人博客”，那么 **Flask 是完全多余的，甚至是个累赘** 。

为了让你更透彻地理解这份手册为什么要这么“绕”，我们需要把它的 **教学意图** 和 **实际工程** 拆开来看。

### 1\. 为什么手册里非要塞进一个 Flask？

从这份《冬令营网站搭建指导手册》的目录和代码来看，出题人（或老师）设计这个环节并不是为了博客服务的，而是为了让你\*\*“刻意练习”\*\*以下技能：

- **理解“动态”与“静态”的区别：**
	- **Hugo (静态)：** 只是生成了一堆 HTML 文件。Nginx 直接把文件甩给浏览器，没有任何计算过程。
	- **Flask (动态)：** 这是一个活的程序。它能接收参数（如 `user/<username>` ），能做逻辑判断，能连接数据库。手册里的作业要求（ *不少于3个路由、动态路由、重定向* ）就是为了强迫你写后端逻辑。
- **掌握 Nginx 的核心技能——反向代理：**
	- 手册的精华在 **3.4.3 节** 的 Nginx 配置。
	- 它要求把访问 `/` 的流量转发给 **Flask (127.0.0.1:8080)** 。
	- 同时把访问 `/myblog` 的流量指向 **Hugo 的静态文件目录** 。
	- **教学目的：** 这是为了教你如何在一台服务器上，用同一个端口（443）同时挂载多个不同的服务（一个 Python 后端 + 一个静态前端）。

**结论：** Flask 在这里是一个\*\*“练手道具”\*\*，用来模拟真实世界中复杂的后端业务。如果没有它，你就学不到“反向代理”和“动态路由”这两个关键知识点。

### 2\. 如果只为了博客，简化的路径是什么？

如果你不在乎“冬令营”的作业分数，只想搭建那个 Hugo 博客，那么 **90% 的步骤都可以删掉** 。

**极简方案（完全抛弃 Flask 和服务器运维）：**

1. **本地：** 安装 Hugo，写文章，生成好站点。
2. **代码托管：** 把整个 Hugo 项目文件夹推送到 **GitHub** 。
3. **部署：** 去 **Netlify** 或 **Vercel** 网站，关联你的 GitHub 仓库。
	- 它们会自动识别这是 Hugo 项目。
	- 当你点“Save”时，它们会自动运行 `hugo` 命令构建网站，并自动分发到全球 CDN。
4. **域名：** 在 Netlify/Vercel 的后台填入你买的 `0xse.cc` ，按照提示改一下 DNS 解析即可。

**对比：**

| 维度 | 手册里的方案 (Flask + Nginx + ECS) | 现代静态方案 (Hugo + Netlify/GitHub Pages) |
| --- | --- | --- |
| **成本** | **高** (需买云服务器、续费) | **0元** (免费额度通常够用) |
| **维护** | **极累** (要管服务器安全、证书续期、软件更新) | **无** (平台全自动) |
| **部署** | 每次都要传文件到服务器 | `git push` 后自动上线 |
| **功能** | 极其强大 (可以做任何后端逻辑) | 仅限展示内容 (无法做登录、复杂数据库交互) |

### 3\. 我给你的建议

**情况 A：如果你是为了完成冬令营作业/拿学分** 你需要忍受 Flask 的繁琐。因为作业里明确要求了“ *不少于3个路由，且必须包含动态路由* ”。这是在考你 Python Web 开发基础，博客只是顺带让你有个可以展示的成果。

**情况 B：如果你是为了自己用，或者以后想搭建独立博客** 做完作业后，建议 **直接抛弃** 这套 Flask + 阿里云 ECS 的架构。 转而使用 **Hugo + GitHub Pages (或 Netlify)** 的方案。

- **理由：** 没人愿意为了写几篇博客，还要每个月去维护一台 Linux 服务器，还得担心服务器被黑客扫爆。Serverless 才是个人博客的最佳归宿。

**总结：** Flask 在这里确实是“为了学而学”的产物。在真实的 *纯内容型* 网站架构中，它确实是没必要的。

get了。这是个教学用的哈？

“Flask (动态)： 这是一个活的程序。它能接收参数（如 user/<username>），能做逻辑判断，能连接数据库。手册里的作业要求（不少于3个路由、动态路由、重定向）就是为了强迫你写后端逻辑。

  

掌握 Nginx 的核心技能——反向代理：

  

手册的精华在 3.4.3 节 的 Nginx 配置。

它要求把访问 / 的流量转发给 Flask (127.0.0.1:8080)。

同时把访问 /myblog 的流量指向 Hugo 的静态文件目录。

教学目的： 这是为了教你如何在一台服务器上，用同一个端口（443）同时挂载多个不同的服务（一个 Python 后端 + 一个静态前端）。”

这部分其实也可以用更合适serverless的技术栈？

是的，完全可以！你现在的理解非常透彻： **原来的手册是在教你用“手工”的方式（Nginx）做一个流量调度员，而 Serverless 技术栈则是把这个调度员变成了“自动化服务”。**

如果要用 **Serverless 技术栈** 来复刻手册里“同一个域名（443端口），既有 Flask 动态后端，又有 Hugo 静态博客”的功能，架构会发生本质的变化。

我们把原来的 **“单体服务器 + Nginx”** 方案，升级为 **“边缘路由 + 云函数 + 对象存储”** 方案。

### 1\. 核心变化：谁来充当 Nginx 的角色？

在 Serverless 架构中，你不再拥有一个一直运行 Nginx 的服务器。取而代之的是平台提供的 **“Edge Network（边缘网络）”** 或 **“API Gateway（网关）”** 。

- **传统方式 (手册)：** Nginx 就像一个看门大爷，坐在服务器门口，看到人来了问：“你去哪？”去 `/` 的指给 Flask 房间，去 `/myblog` 的指给 Hugo 仓库。
- **Serverless 方式：** 这是一个智能导航系统。你在配置文件（如 `vercel.json` 或 `netlify.toml` ）里写好规则，流量在到达你的代码之前，就已经在云厂商的边缘节点被分流了。

### 2\. 具体怎么实现？（以 Vercel 为例）

如果你要把手册里的作业搬到 Vercel 上，操作流程是这样的：

#### A. 目录结构调整

你需要把 Flask 代码和 Hugo 生成的静态资源放在同一个项目里（或者通过配置关联）。

Plaintext

```markdown
my-project/
├── api/                  <-- 这里放 Flask 代码 (替代原来的 8080 端口服务)
│   └── index.py          <-- Vercel 会把这个文件变成一个云函数
├── public/               <-- 这里放 Hugo 生成的静态 HTML (替代 /myblog 目录)
└── vercel.json           <-- 核心配置文件 (替代 Nginx 配置)
```

#### B. 替代 Nginx 配置 (vercel.json)

你不需要写复杂的 `location /proxy_pass` ，只需要写路由重写规则（Rewrites）：

JSON

```markdown
{
  "rewrites": [
    { 
      "source": "/myblog/:path*", 
      "destination": "/public/:path*"  // 静态请求：直接去拿文件
    },
    { 
      "source": "/(.*)", 
      "destination": "/api/index.py"   // 动态请求：触发 Flask 云函数
    }
  ]
}
```

- **静态部分 (Hugo)：** 当用户访问 `/myblog` ，Vercel 直接从全球 CDN 节点返回 HTML 文件，速度比你自己搭建的 Nginx 快得多。
- **动态部分 (Flask)：** 当用户访问 `/` ，Vercel 瞬间启动一个隔离的 Python 环境（冷启动），运行你的 `index.py` 处理逻辑，返回结果，然后立刻销毁环境。

### 3\. Serverless 方案的优劣对比

如果要完成同样的“教学目标”，Serverless 方案表现如下：

| 维度 | 手册里的 Nginx 方案 | Serverless 方案 (如 Vercel/AWS Lambda) |
| --- | --- | --- |
| **计费模式** | **包月/包年** (服务器开着就在烧钱) | **按次付费** (有人访问才扣费，没人访问 0 元) |
| **并发能力** | **有限** (人多了 Flask 会卡死，需手动扩容) | **无限** (自动并发，来 1 万人就起 1 万个函数实例) |
| **运维难度** | **高** (需管 Linux 安全、Nginx 配置、证书) | **零** (平台全管，你只写 Python 代码) |
| **部署速度** | 慢 (Git Pull -> 重启服务) | 快 (Git Push -> 自动构建上线) |
| **适用场景** | **学习原理** 、长连接应用 (WebSocket) | **生产环境** 、API 服务、博客、电商 |

### 4\. 为什么教学还要用老办法？

虽然 Serverless 更先进，但如果我是老师， **我也可能先教你 Nginx 方案** ，原因如下：

1. **黑盒 vs 白盒：** Serverless 把底层全屏蔽了。用 Vercel 你根本不知道 HTTP 请求是怎么被转发的，你学不到 TCP/IP、端口、反向代理这些计算机网络的基础知识。
2. **通用性：** 学会了 Nginx，你可以去任何公司管理任何服务器；学会了 `vercel.json` ，你换到 AWS 甚至换回自建机房时，还得重新学一遍。
3. **状态管理：** 手册里的 Flask 是“活”的，内存里的变量一直在；Serverless 的 Flask 是“用完即扔”的，你无法在内存里存东西（必须存到数据库），这对初学者来说理解门槛更高。

**总结：** 你完全可以用 Serverless 技术栈复刻这个作业，甚至做得更漂亮、更快、更省钱。 **手册是在教你“造汽车的原理”（引擎、传动轴），而 Serverless 是直接给你一辆“自动驾驶汽车”。** 学会前者能让你成为工程师，使用后者能让你成为高效的创造者。

好吧。那如果审视这个教学的方案来说，是必要的嘛？

这是一个非常深刻的问题。要回答“是否有必要”，我们必须结合这份手册的 **受众** （清华附中冬令营学生）和 **背景** （DataCon 数据安全竞赛、清华大学联合发起）来看。

**结论先行：** 如果你仅仅想成为一个“能做网站的人”，这份方案 **完全没必要** ，是浪费生命。 但如果你想成为一名 **计算机工程师、架构师或网络安全专家** （这正是 DataCon 和清华附中冬令营的培养目标），那么这个方案不仅必要，而且是\*\*“必修课”\*\*。

我们可以从三个层面来审视这个教学方案的必要性：

### 1\. 视角的转换：从“乘客”到“司机”

Serverless（Vercel 等）方案就像是\*\*“打车”\*\*。

- 你只需要告诉司机（平台）你要去哪（部署代码），剩下的路线规划、红绿灯、引擎维护你都不用管。
- **优点：** 快、舒服、省心。
- **缺点：** 只要车坏了，或者司机迷路了，你只能干瞪眼，因为你连引擎盖怎么打开都不知道。

手册里的方案（VPS + Nginx + Linux）就像是\*\*“学考驾照” **，甚至包含了一点** “修车”\*\*。

- 你必须学会挂挡（配置端口）、看仪表盘（查看日志）、换机油（环境依赖管理）。
- **必要性：** 只有当你亲手配置过 Nginx 炸过几次，因为防火墙没开导致连不上，因为权限不够导致 403 错误，你才能真正理解\*\*“互联网到底是怎么跑起来的”\*\*。

### 2\. 安全视角的刚需（结合手册背景）

注意手册里提到的 **DataCon（数据安全竞赛）** 和 **网络安全** 。

- **Serverless 屏蔽了攻击面：** 在 Vercel 上，你接触不到操作系统。你无法模拟“提权漏洞”、无法练习“SSH 爆破防护”、无法配置 `iptables` 防火墙规则。因为平台把最底层的安全都做好了。
- **VPS 是最好的靶场：** 手册让你租一台裸机（阿里云 ECS），这就给了你一个完整的、脆弱的攻击面。
	- 你把端口开错了，会被扫描。
	- 你的 Flask 代码写了漏洞，服务器会被黑。
	- **教学目的：** 只有拥有了对服务器的 **完全控制权（Root 权限）** ，你才能学习如何 **防御** 它。安全专家必须懂底层，黑客不会只攻击你的 Python 代码，他们会攻击你的 Nginx 配置、你的 Linux 内核、你的 SSH 服务。

### 3\. 排错能力（Troubleshooting）的培养

在职业生涯中，高级工程师和初级工程师最大的区别在于\*\*“修锅”的能力\*\*。

- **场景：** 网站挂了，报 502 Bad Gateway。
- **Serverless 用户：** “平台挂了？还是我代码有问题？我看不到日志，我只能盲猜，或者去提工单等客服。”
- **经历过手册训练的用户：**
	- “502 意味着 Nginx 活着，但后端的 Flask 挂了。”
	- “我去 `/var/log/nginx/error.log` 看一眼。”
	- “哦，原来是 Flask 的端口没对上，或者是 Python 进程被系统杀掉了（OOM）。”
- **必要性：** 这份手册极其繁琐的步骤，其实是在帮你建立\*\*“全链路”的心理模型\*\*。一旦你脑子里有了这个模型（浏览器 -> DNS -> Nginx -> 反向代理 -> Flask -> 数据库），未来遇到任何架构问题，你都能迅速定位。

### 4\. 总结：这是一种“成人礼”

回到你的问题： **这套方案是必要的吗？**

- **对于现在的你（可能是为了快速完成作业）：** 它看起来很笨拙，甚至有点过时。你可能会觉得“为什么要我手动申请证书？Certbot 好麻烦，Caddy 一行命令就搞定了。”
- **对于未来的你（如果走技术路线）：** 这是一次\*\*“祛魅”\*\*的过程。

在这份手册里，你其实是在 **手动复刻 Vercel 内部所做的事情** 。

- 你写的 `nginx.conf` ，就是 Vercel 的路由层。
- 你用的 `tmux` ，就是 AWS 的进程守护。
- 你申请的 SSL 证书，就是 Cloudflare 的自动加密。

**建议：** 把它当作一次\*\*“解剖课”\*\*。虽然现在有 MRI（核磁共振）可以直接看病（Serverless），但医学院的学生依然需要亲手解剖尸体（VPS + Nginx），因为只有这样，你才能真正理解人体的构造。

**做完这一次，以后你可以心安理得地使用 Vercel，因为你已经懂了它背后的魔法。**

你不要这么上价值。

我就是让你看看，从我给你复制的手册上来说，他是因为配置太过冗余导致的麻烦，还是故意让学生学习的配置？

  

以及潜在风险没有考虑到：

1\. 容易被扫描扫爆

2\. 从学习的角度来说，一直在用干什么（很多步骤）。其实也没有很涉及到原理？？

既然你希望能“祛魅”，直接看透这份手册的本质，那我就不跟你谈“培养工程师思维”这种虚的了。

直接回答你的结论： **这份手册的配置方式确实存在明显的“工程设计缺陷”和“教学效率低下”的问题。**

它并不完全是“故意为了教学设计的复杂”，更多是因为 **编写者的技术栈惯性** 或者 **缺乏教学优化的偷懒** 导致的冗余。

我们可以针对你提出的两点风险和“配置冗余”进行具体的拆解：

### 1\. 是故意让学习，还是单纯的配置冗余？

**判定：大约 30% 是必要的流程，70% 是因为方案老旧或选择不当人为制造的“配置地狱”。**

这里有几个非常明显的“没必要”的麻烦点，完全属于 **负面教学** ：

- **HTTPS 证书申请方式（极度槽点）：**
	- **手册做法：** 使用 `certbot --manual --preferred-challenges=dns` 。这要求学生去 NameSilo 后台手动添加一条 DNS TXT 记录，然后等待全球 DNS 生效（可能 10 分钟，也可能 1 小时）。
	- **为什么这是烂设计：** 这不仅慢，而且容易让学生卡在“怎么还没生效”这种和编程原理无关的网络延迟上。
	- **正确/高效的教学做法：** 应该使用 `HTTP-01` 挑战（Nginx 插件模式）。Certbot 会自动在网站目录放一个文件，Let's Encrypt 访问一下就验证通过了， **全程 5 秒钟，全自动** 。让学生去改 DNS TXT 记录，除了折磨人，并没有增加对 HTTPS 原理的理解。
- **Tmux 用于服务部署：**
	- **手册做法：** 教学生用 `tmux` 开一个窗口跑 Flask，然后挂在后台。
	- **为什么这是烂设计：** `tmux` 是终端复用工具，是给 **人** 用的，不是给 **服务** 用的。服务器一重启，网站就没了。这教的是一种“临时凑合”的坏习惯，而不是标准的“服务管理”。
	- **正确/高效的教学做法：** 如果要教原理，应该教 `Systemd` （Linux 的标准服务管理器）或者 `Supervisor` ，再不济写个 `nohup` 脚本。用 Tmux 跑生产环境，是在误导学生。
- **Windows 本地环境配置：**
	- 让学生在 Windows 上配 Python、Pip、Hugo 环境变量，这一步在冬令营这种短周期活动中，纯属\*\*“劝退环节”\*\*。Windows 的环境配置坑极多，而且跟服务器的 Linux 环境完全是两码事，属于无效重复劳动。

### 2\. 潜在风险分析

你的直觉非常敏锐，这份手册在实操中确实埋了很多雷。

#### 风险一：容易被扫描扫爆（安全裸奔）

- **Flask 的 `debug=True` ：**
	- 手册代码里写着 `app.run(host='0.0.0.0', port=8080, debug=True)` 。
	- **致命伤：** 在公网服务器上开 Debug 模式是 **大忌** 。一旦报错，浏览器直接显示具体的报错代码甚至环境信息。黑客或者扫描脚本看到这个，简直是狂欢。
- **端口全开：**
	- 手册似乎没有提到配置云服务器的安全组（Firewall）或者系统内的 `ufw` 。
	- 这意味着这台服务器不仅 80/443 开着，SSH 端口、Flask 的 8080、甚至可能的数据库端口都暴露在公网。学生刚配好，可能就被挖矿脚本植入了。
- **权限管理缺失：**
	- 手册里大量使用 `/root/` 目录进行操作。教新手直接用 `root` 账户跑 Web 服务，一旦 Web 服务有漏洞，整个服务器直接沦陷。这是最典型的反面安全教材。

#### 风险二：一直在“Copy-Paste”，其实没涉及到原理

这是“以手册代教学”最容易出现的问题： **机械式操作掩盖了原理缺失。**

- **只教了“What”，没教“Why”：**
	- 学生会把 Nginx 的配置文件完整复制进去，改个域名。如果问他：“为什么要有 `location /` 和 `location /myblog` ？流量是怎么分流的？” 他大概率答不上来。他只知道“不这么填就跑不通”。
- **错把“熟练度”当“知识”：**
	- 在 Windows 上装一遍 Hugo，去 Linux 上再装一遍。学生觉得自己“学会了安装”，其实只是把这几个命令背熟了。
	- 真正的原理（比如：静态网站生成器是如何把 Markdown 变成 HTML 的？Nginx 的反向代理是如何通过 Header 里的 Host 字段识别域名的？）在繁琐的 `apt install` 和 `nano` 编辑中被淹没了。

### 总结

这份手册更像是一份\*\*“运维备忘录” **（而且是几年前习惯的运维），而不是一份优秀的** “教学讲义”\*\*。

- **对于配置：** 它选择了最笨重、容错率最低的路径（特别是 DNS 验证证书和 Tmux 部署）。
- **对于原理：** 它通过大量的机械操作稀释了核心知识点。
- **对于安全：** 它为了省事（用 root，开 debug），牺牲了基本的安全原则，这对“网络安全冬令营”来说，甚至有点讽刺。

**结论：** 你的吐槽完全站得住脚。这确实是配置太过冗余，且设计上有硬伤。如果目的是为了高效学习原理，完全不应该这么教。

这个连接到公司的ssh，你结合一下他在文档中的位置，考虑一下，整个流程这么设计到底有啥用？？？

结合你提供的图片以及之前的手册上下文（特别是 **1.5 章节：从 DataCon 竞赛平台获取实验所需云服务器** ），这个步骤的设计其实是非常典型的\*\*“CTF（夺旗赛）”或“实训平台”\*\*的标准化流程。

虽然看起来让你“先登录网页版终端，再获取账号密码”有点脱裤子放屁（多此一举），但从 **教学管理** 和 **竞赛运维** 的角度来看，这个设计是 **绝对必要** 的“控制层”。

以下是深度解析：

### 1\. 它在文档中的位置与作用

- **位置：** 第 1.5 节。位于“基础环境搭建”之后，“阿里云服务器购买（可选）”之前。
- **表面作用：** 给学生发一台服务器，并告知 IP、账号和密码。
- **实际作用：** **分发标准化的“考试卷子”（统一环境）。**

### 2\. 为什么非要这么设计？（这个流程的底层逻辑）

如果你觉得它麻烦，是因为你站在“个人开发者”的角度；但如果站在“出题人/老师”的角度，这个步骤解决了四个致命痛点：

#### A. 屏蔽“环境差异”这个最大的教学杀手

- **问题：** 如果让学生自己买阿里云，有人买 Ubuntu 20.04，有人买 CentOS 7，有人买 Debian。
	- 结果：你的手册里写 `apt install nginx` ，CentOS 的学生输入进去报错（因为是用 yum），然后举手问老师，课堂进度直接崩盘。
- **解决：** 这个网页版 SSH 进去的服务器，是主办方 **预先封装好的 Docker 容器或虚拟机镜像** 。里面可能已经预装了某些依赖，或者系统版本被严格锁定（比如 Ubuntu 22.04 LTS）。 **这确保了手册里的每一行代码，在每一个学生的机器上都能跑通。**

#### B. 提供“一键重置”的后悔药（看图片顶部）

- **细节：** 注意看图片里的按钮，有\*\*“重置密码” **，甚至通常会有** “重置环境”\*\*。
- **场景：** 新手极其容易把环境搞挂（比如删了系统文件、配置 Nginx 把 SSH 端口封死了、或者把 Python 环境搞乱了）。
- **价值：** 如果是你自己买的阿里云，把 SSH 搞挂了，你需要去阿里云控制台折腾 VNC 或者重装系统，流程很长。在这里，只要点击网页上的按钮，环境瞬间重置。 **这对于新手教学是刚需。**

#### C. 解决“内网穿透”与“计费”问题

- **计费：** 学生不需要绑定信用卡，不需要付费。这是学校/主办方买单的资源池。
- **网络：** 很多时候，这种实训环境是在内网里的，或者是通过动态端口映射出来的（注意看图片里的“服务端口号：45001”）。这意味着它可能不是一个标准的公网 22 端口。这个网页页面是唯一能准确告诉你\*\*“当前你的入口在哪里”\*\*的地方。

#### D. “Bootstrapping”（引导）过程

- 你必须先有“鸡”，才能生“蛋”。
- 为了让你能用 VS Code 这种舒适的工具远程连接（后续步骤），你必须 **先知道** IP 和密码。
- 这个网页版 SSH 终端（通常基于 Guacamole 或类似技术）是 **不仅不依赖客户端，也是唯一能“无条件”连接到服务器** 的方式。它充当了\*\*“前台接待处”\*\*的角色——你去前台拿了房卡（IP/密码），然后才能去你的豪华套房（VS Code）里睡觉。

### 3\. 总结：它的真实身份

这个步骤根本不是为了让你在这个网页黑框框里写代码（那体验极差，卡顿且无法复制粘贴）。

它的真实身份是： **云资源的动态分发与控制面板** 。

- **对学生：** 这是一个\*\*“领准考证”\*\*的地方。拿了 IP 和密码就赶紧溜，去用 VS Code 或者本地 Terminal 连接。
- **对老师：** 这是一个\*\*“避雷针”\*\*。保证所有人起跑线一致，坏了能一键修好。

所以，虽然繁琐，但在集体教学/竞赛场景下，这个设计是 **非常成熟且必要** 的工业化流程。

那你结合整体流程来说明一下，这个方案哪些是必要的，哪些可能就是疏忽的

结合这份 100 多页的手册内容以及你提供的平台截图，我们可以把整个流程做一个很客观的“拆解”。

哪些步骤是\*\*“教学或环境刚需” **（不得不做），哪些是** “设计疏忽或偷懒”\*\*（完全可以优化但没做，纯粹在折磨学生）：

### 一、 必须保留的步骤（教学与管理的刚需）

这部分看起来繁琐，但在特定背景下是无法砍掉的。

#### 1\. 1.5 章节：DataCon 平台的网页终端（即你截图的部分）

- **必要性等级：★★★★★**
- **理由：** 这是“发卷子”的环节。
	- **标准化：** 就像考试必须发统一的答题卡一样，平台分发的服务器（容器）保证了所有学生的系统环境（Ubuntu）、预装软件是一模一样的。
	- **兜底机制：** 截图中的\*\*“重置环境/重置密码”\*\*是新手的救命稻草。如果是学生自己买的云服务器，把 SSH 配置玩坏了就只能重装系统，耗时极长。
	- **内网穿透：** 截图显示端口是 `45001` 而不是默认的 `22` ，说明服务器在内网，必须通过这个平台获取映射出来的入口。

#### 2\. 1.3 章节 + 3.5 章节：同时部署 Flask 和 Hugo

- **必要性等级：★★★★☆**
- **理由：** 这是为了制造“冲突”。
	- 如果只部署一个 Hugo，直接扔在 Nginx 根目录就行了，没什么难度。
	- 手册故意让你同时跑一个动态应用（Flask）和一个静态网站（Hugo）， **强行制造了“一个 443 端口怎么分给两个应用”的难题** 。这迫使你必须去学 Nginx 的 `location` 路由匹配和 `proxy_pass` 反向代理。这是负载均衡和网关技术的基石。

#### 3\. 3.4 章节：手写 Nginx 配置文件

- **必要性等级：★★★★☆**
- **理由：** 也就是所谓的“白盒教学”。
	- 虽然 Serverless 或 Caddy 能一键搞定，但对于网络安全方向的学生，必须看懂 HTTP Header、Host 字段、以及流量是如何被这一行行配置“转发”的。这是后续学习 WAF（Web应用防火墙）配置的基础。

---

### 二、 纯粹的疏忽与设计缺陷（人为制造的麻烦）

这部分内容属于\*\*“教错了” **或者** “用战术上的勤奋掩盖战略上的懒惰”\*\*，是完全可以优化掉的冗余。

#### 1\. 3.4.2 章节：HTTPS 证书的手动 DNS 验证 (Certbot Manual Mode)

- **疏忽等级：★★★★★ (最大槽点)**
- **手册做法：** 让学生去 NameSilo 后台加 TXT 记录，然后等全球 DNS 生效。
- **为何是疏忽：**
	- **效率极低：** DNS 生效时间不可控（10分钟-24小时），上课时几百个学生干等，极其拖慢节奏。
	- **技术落后：** 既然已经装了 Nginx，标准做法是使用 `certbot --nginx` 插件，它会自动修改 Nginx 配置完成验证， **全程 5 秒钟，无需人工干预** 。让学生手动改 DNS 除了增加挫败感，学不到任何核心技术。

#### 2\. 3.3.2 章节：使用 Tmux 进行服务“持久化”

- **疏忽等级：★★★★☆**
- **手册做法：** 开个 Tmux 窗口跑 Flask，假装它是一个后台服务。
- **为何是疏忽：**
	- **误人子弟：** 这是运维人员临时调试用的“野路子”，不是生产环境的标准做法。
	- **正确姿势：** 既然是 Linux 教学，应该教 `Systemd` （写个 `.service` 文件）或者 `Supervisor` ，甚至简单的 `nohup` 。教 Tmux 导致学生以后工作中也会习惯性地用这种“一重启就丢”的方式跑服务。

#### 3\. 1.1 & 1.2 章节：Windows 本地环境配置 (Python/Hugo)

- **疏忽等级：★★★☆☆**
- **手册做法：** 在 Windows 上装 Python、配环境变量、装 Hugo。
- **为何是疏忽：**
	- **环境隔离：** 本地 Windows 环境和服务器 Linux 环境完全不同，本地跑通了不代表服务器能跑通（比如路径斜杠 `\` 和 `/` 的区别）。
	- **多此一举：** 既然已经有了服务器，完全可以教学生使用 **VS Code Remote - SSH** ，直接连接到服务器上开发。这样所有环境都在服务器上配一遍即可， **省去了在 Windows 上折腾环境变量的一半篇幅** 。

#### 4\. 安全意识的缺失 (Root + Debug)

- **疏忽等级：★★★★★ (严重隐患)**
- **手册现状：** 全程使用 `root` 权限操作，Flask 开启 `debug=True` 跑在公网。
- **为何是疏忽：** 作为“网络安全冬令营”的教材，这是最讽刺的一点。它教了怎么搭建，却没教最基本的安全基线（最小权限原则、关闭调试模式）。这就像教人盖房子，却忘了教人装防盗门，还把钥匙插在锁孔里。

### 总结

- **这套方案的核心逻辑（DataCon平台 -> ECS -> Nginx -> 应用）是合理的** ，符合底层原理教学的需求。
- **但是，具体的执行路径（Implementation）非常糟糕。** 编写者似乎习惯了 5-10 年前的运维方式（手动签证书、Tmux 挂后台），并且为了省事（避免解释 Systemd、避免配置 SSH Key），选择了看似简单实则隐患无穷的“土办法”。

**一句话评价：** 骨架是好的（适合教学），但填充的血肉（具体操作步骤）充满了陈旧的脂肪和坏死的组织。

还真是，已经连了服务器干啥还要配置Windows环境？

  

我们再来梳理一下这个文档的逻辑，和可能的问题？以及理论和实践的割裂点，各个模块之间的割裂点？（比如怎么从flask到hugo了）

冬令营网站搭建指导手册

清华附中

20260126

  

目录

实验前置基础条件 1

1 基础环境搭建 2

1.1 Python + Pip 2

1.2 Visual Studio Code 5

1.3 Flask框架 20

1.4 Git工具 44

1.5 从DataCon竞赛平台获取实验所需云服务器 54

1.6 阿里云服务器购买 61

2 域名配置 63

2.1 域名注册 63

2.2 域名解析配置 70

2.3 DNS缓存清理 74

3 网站搭建 79

3.1 服务器上部署项目代码 79

3.2 服务器安装Flask 82

3.3 启动网站 83

3.4 Nginx配置 87

3.4 HTTPS配置 89

3.5 博客网站搭建 102



【环境介绍与实验目标】

‘欢迎来到“云端网站搭建”冒险之旅！在这个模块中，你将体验一次从“本地实验室”到“全球舞台”的奇妙转变——亲手搭建一个属于自己的网站，并把它安全地送上互联网！就像建造一座数字小屋：先在自己电脑上设计搭建（Flask开发），然后为它在云服务器上安个“家”（阿里云部署），最后挂上专属门牌（域名）并加上安全锁（HTTPS证书）。学完这个模块，你不仅能掌握网站开发的核心技能，还能理解真实网站如何运行在互联网上，让全世界的小伙伴都能安全访问你的创意成果！

本次实验将在本地Windows系统与远程阿里云Ubuntu服务器环境下，完成一个基于Flask框架的本次课程实验网站和一个基于Markdown转HTML博客网站从开发到安全部署的完整流程。首先，完成Python、Pip等基础运行环境的配置，学习、开发Flask应用和部署；之后，购买域名并将其解析指向阿里云服务器的公网IP，实现通过域名访问服务器的效果；接着，在服务器上部署本次课程实验网站源码，并为该网站申请TLS证书。通过Nginx设置反向代理，将外部HTTP/HTTPS的请求转发至服务器的本次课程实验网站；最后，学习Markdown转HTML快速生成网站，并实现通过Nginx额外部署个人博客网站。

【实验前置基础条件】

本实验涉及第三方平台账号注册、域名购买，为确保实验顺利进行，请所有学员确保上课时：

1\. 拥有一个上课时可登陆的个人电子邮箱用来接受邮箱验证码（推荐使用126、163邮箱），需要在上课前提前注册并在浏览器中登陆（必须）；

2\. 确保能够通过支付宝进行支付，预计支付金额为3-5美元（约合人民币20-30元）用来购买个人域名，请学生自备具备支付能力的手机、平板、电子手表等电子设备（按照学校要求统一管理）；如不具备上述条件，可在课上联系班主任协助支付。

3\. 实验基于Windows操作系统设计，如使用MacOS、Linux等其他操作系统，实验步骤可能与手册略有区别，需要自行解决可能面临的环境、步骤不一致问题。

4\. 使用手机号提前注册硅基流动账号（https://account.siliconflow.cn/zh/login），并且绑定个人邮箱，方便上课时通过邮箱登陆。

5\. 上课时能够随时访问网页版AI应用（DeepSeek、元宝、豆包等均可），本活动鼓励学生借助AI工具完成实验、解决问题。

1 基础环境搭建

1.1 Python + Pip

1.1.1 介绍Python与Pip

Python 是一种高级、解释型且通用的编程语言，以其简洁明了、类似英语的语法和出色的代码可读性而著称，非常适合编程初学者入门。同时，它功能极为强大，应用领域覆盖网页开发、数据分析、人工智能及自动化脚本等众多方面，并拥有一个由全球开发者共同构建的庞大生态系统，提供了数百万个第三方库和工具包，使得开发者能够轻松复用代码，快速实现复杂功能，而无需从零开始。

Pip 是 Python 的包管理工具，堪称 Python 的“软件管家”，其核心工作是从在线仓库（主要是 PyPI）中查找、安装、升级和卸载第三方库或包。借助 pip，用户只需使用简单的命令（如 pip install 包名 进行安装、pip list 列出已安装包、pip uninstall 包名 卸载包）即可高效管理依赖和扩展功能。

通常，在安装 Python（版本 3.4 或 2.7.9 以上）时，pip 会自动一同安装，无需额外安装。为开发者使用丰富的 Python 生态系统提供了极大便利,本书以python 3.14.2和 pip 25.3为例，介绍后续实验的操作。

1.1.2 安装Python与Pip

Python官网：https://www.python.org/

Python下载地址：https://www.python.org/downloads/ 本文以目前最新版本python 3.14.2为例进行后面实验，访问：https://www.python.org/downloads/release/python-3142/

下滑页面中找到 Windows installer (64-bit) 点击下载。

  

  

下载完成后，在本机双击python-3.14.2-amd64.exe进行安装，注意一定要选中 Add python.exe to PATH，将python解释器添加至系统全局变量中，否则需要自行手动配置，后续步骤默认点击即可。如忘记勾选，可再次执行安装程序，删除Python后重新安装。

  

为方便实验演示，这里我们将Python安装在 C:\\python 路径下，完成后可在C:\\python目录中看到对应的文件内容。

  

1.1.3 验证安装是否成功

按Win+R组合键，打开电脑CMD（Command Prompt，中文：命令提示符， Windows 操作系统中的一个命令行解释器）。

  

分别执行以下命令，若出现版本号即说明安装成功。

\# python --version

\# pip --version

  

1.2 Visual Studio Code

Visual Studio Code（VS Code）是一款由微软开发的免费、开源、跨平台代码编辑器，它以轻量级和高性能为核心，通过强大的扩展生态几乎支持所有编程语言和开发场景。VS Code不仅提供智能代码补全（IntelliSense）、集成调试器、内置Git控制和终端，还可借助海量扩展实现远程开发、容器管理、数据科学等高级功能，在简约编辑器与全功能IDE之间取得了完美平衡。其持续迭代的更新机制、高度可定制的界面以及活跃的社区支持，使其成为全球开发者首选的现代化开发工具，适用于从Web前端到云端微服务的各类项目。

1.2.1 安装VS Code

浏览器访问VS Code官网地址：https://code.visualstudio.com/ ，点击下载按钮。

  

  

当前最新版本为VS Code 1.107.1，下载完成后双击运行VSCodeUserSetup-x64-1.107.1.exe，为方便实验演示，本次安装路径为：D:\\VSCode\\Microsoft VS Code。

  

安装过程中，可为VS Code添加桌面快捷键，这样方便后期启动VS Code。

  

安装完成后，在桌面双击VS Code图标，启动VS Code。

  

1.2.2 安装第三方扩展

按照图例顺序，选中左方按钮，进入插件功能（EXTENSION）。

插件一：简体中文

搜索Chinese，选择Chinese (Simplified) Language Pack for Visual Studio Code，其核心功能只有一个，就是将 VS Code 的用户界面本地化为简体中文。

  

通过使用“Configure Display Language”命令显式设置 VS Code 显示语言，可以替代默认 UI 语言。 按下“Ctrl+Shift+P”组合键以显示“命令面板”，然后键入“display”以筛选并显示“Configure Display Language”命令。

  

  

此时会出现提示重启生效，点击 Restart 按钮，重启VS Code。

  

重启后，就能看到VS Code中呈现为简体中文样式。

  

插件二：Python

Python插件是一个官方开发的强大扩展，它将轻量级的代码编辑器转变为功能完备的Python集成开发环境（IDE）。该插件提供了代码智能补全、语法高亮、定义跳转等核心编辑功能，并集成了可视化调试器、多种代码格式化与检查工具。它让开发者能直接在编辑器中管理Python解释器和虚拟环境、运行单元测试，甚至无缝编写和运行Jupyter Notebook，从而显著提升从Web开发、数据分析到机器学习等各类Python项目的开发效率与体验。

  

使用快捷键 Ctrl+Shift+P 输入 Python: Select Interpreter ，择已安装的Python解释器。

  

下面演示创建一个新Python文件的操作过程。

  

  

  

编辑Python文件内容。

  

按Ctrl + S保存文件，指定保存的路径，这里以保存的桌面为例。

  

  

插件三：Remote-SSH

Remote-SSH插件允许开发者通过安全的SSH协议，直接连接到远程服务器、虚拟机或容器，并在本地VS Code界面中获得与本地开发几乎无异的完整开发体验。开发者可以像操作本地文件一样，在远程机器上无缝地浏览、编辑、运行和调试代码，同时还能安装和使用各种VS Code扩展。这消除了环境配置差异带来的困扰，特别适用于需要在远程高性能服务器、专属测试环境或统一生产环境中进行开发的场景，极大地简化了远程开发工作流。

  

  

下图为两个ssh连接配置的样例，第一个为使用常规密码登录服务器，第二个是使用公钥免密登录服务器。编辑、保存右侧配置文件后，左侧就会出现对应的服务列表名称。本实验中需要学生替换为自己的服务器IP地址和用户名。如需使用公钥免密登录请自行了解，本实验不做要求。如何获取服务器地址请参考1.5章节 从DataCon竞赛平台获取实验所需云服务器。

  

完成配置后，点击连接按钮。

  

初次登录时需要指定服务器的系统类型,本课程统一使用linux系统。

  

  

每次登录时都需要输入密码，已配置公钥免密登录的无需输入密码。

  

连接成功示意图：

  

连接成功后可创建新文件，直接远程对文件进行内容编辑。如需运行Python文件，可参考1.2.3 VS Code终端，在VS Code中通过远程终端执行Python命令。

  

也可选择打开远程文件夹，默认会出现根路径（/）下的所有文件夹，这里以打开 /root/ 为例。

  

  

连接成功后，在左侧就能看到 /root/ 文件夹中的所有文件目录。

  

可通过拖拽本地主机文件到该目录，实现上传本地文件到服务器指定路径的效果。

  

上面演示的是将本地文件上传到服务器，这里演示如何将服务器文件下载到本地。右键服务器目录栏中要下载的文件，点击下载按钮可从服务器下载文件到本地。

  

如果未断掉当前远程登录状态就直接关闭VS Code，那么之后打开VS Code就会自动恢复上次的异常中断。下面演示如何手动关闭远程连接。

  

1.2.3 VS Code终端

打开终端方式一：

在顶部工具栏中选择终端、新建终端。

  

打开终端方式二：

或者使用快捷键： ” Ctrl + ~ ” 在VS Code中打开终端。

  

  

若当前终端被占用，可增加多个终端。

  

  

1.3 Flask框架

Flask是一个基于Python的轻量级Web应用框架，以其简洁灵活的设计理念受到开发者广泛欢迎。它提供了核心的请求-响应处理与路由功能，允许开发者通过丰富的第三方扩展（如数据库集成、表单验证、用户认证等）按需构建复杂应用，既适合快速搭建原型与API服务，也能支撑企业级产品开发。许多知名公司如Netflix、Uber、豆瓣网以及字节跳动的部分后台系统均采用Flask构建高效可靠的服务，体现了其在生产环境中的强大扩展性与实用性。

1.3.1 安装Flask

可使用VS Code终端直接安装Flask，如在本地VS Code中安装Flask。

\# pip install flask

  

1.3.2 Flask简单网站代码

新建app.py文件，并写入：

\# 导入Flask类，用于创建Web应用

from flask import Flask

\# 创建Flask应用实例，\_\_name\_\_表示当前模块名，用于确定应用根目录

app = Flask(\_\_name\_\_)

\# 使用装饰器定义路由，将URL路径'/'与下面的函数绑定

@app.route('/')

def hello\_world():

\# 当用户访问根路径时，返回字符串'Hello, World!'作为响应

return 'Hello, World!'

\# 判断当前模块是否作为主程序运行（而不是被import导入）

if \_\_name\_\_ == '\_\_main\_\_':

\# 启动Flask开发服务器

\# host='0.0.0.0': 允许外部设备通过服务器IP访问

\# port=8080: 监听8080端口

\# debug=True参数开启调试模式：

\# 1. 代码修改后自动重启服务器

\# 2. 提供详细的错误页面

\# 3. 禁用生产环境优化

app.run(host='0.0.0.0', port=8080,debug=True)

根据上面的app.py可以清楚地看到，其实Flask核心代码主要分为三部分。第一部分是创建Flask应用实例对象；第二部分是对浏览器访问网站的URL进行处理并返回相应的内容（路由系统），上面案例中直接返回字符串，真实环境中将返回指定的HTML页面或跳转到其他页面；第三部分主要负责网站对外开放的IP和端口等基本信息。

在VS Code中启动上述app.py，根据提示，可以看到网站已部署到本地8080端口。

  

选择http://127.0.0.1:8080,CTRL+鼠标点击直接打开该连接，或复制到浏览器中访问，所能看到的就是Flask框架呈现的一个最简单案例。

  

1.3.3 Flask路由系统

路由（路径）是Web应用中定义URL与处理函数之间映射关系的核心机制。

Flask中@app.route的第一个字符串参数叫做URL，被@app.route装饰的函数叫做视图函数。通过以下6个案例来讲解Flask中基本的路由设定。

app.py

from flask import Flask, request, jsonify

app = Flask(\_\_name\_\_)

###案例1###

@app.route('/') # 这里的'/'就是URL

def home(): # 这里的home()就是视图函数

return '欢迎来到首页！'

###案例2###

@app.route('/hello')

@app.route('/hi')

@app.route('/greet')

def greet():

return '你好！访问 /hello 或 /hi 或 /greet'

###案例3###

@app.route('/user/<username>')

def show\_user\_profile(username):

return f'用户: {username} 的个人主页'

###案例4###

@app.route('/post/<int:post\_id>')

def show\_post(post\_id):

return f'文章ID: {post\_id} 的内容'

###案例5###

@app.route('/api', methods=\['GET', 'POST'\])

def handle\_api():

if request.method == 'GET':

return jsonify({'method': 'GET请求成功'})

else:

return jsonify({'method': 'POST请求成功'}), 201

###案例6###

\# /photos "拍照"这个功能按钮

@app.route('/photos')

def take\_photo():

return "📸 点击这里拍照"

\# /books/ "所有书"的列表

@app.route('/books/')

def view\_books():

return '''

📁 你的所有书：

\- 书1.jpg

\- 书2.jpg

\- 书3.jpg

'''

if \_\_name\_\_ == '\_\_main\_\_':

app.run(host='0.0.0.0', port=8080,debug=True)

1\. 基本路由（默认路由） - 绑定首页函数

@app.route('/')

def home():

return '欢迎来到首页！'

作用：当用户访问 http://127.0.0.1:8080/ 时触发，通常作为网站的入口点，对应服务器的根目录。

  

2\. 多个路由规则绑定同一个函数

@app.route('/hello')

@app.route('/hi')

@app.route('/greet')

def greet():

return '你好！访问 /hello 或 /hi 或 /greet'

作用：URL别名：多个URL指向同一功能，向后兼容：保留旧URL的同时使用新URL，用户体验：提供多种访问方式。

示例：访问http://127.0.0.1:8080/hello、http://127.0.0.1:8080/hi、http://127.0.0.1:8080/greet都返回同一页面。

  

  

  

3\. 动态路由 - 绑定用户页面函数

@app.route('/user/<username>')

def show\_user\_profile(username):

return f'用户: {username} 的个人主页'

作用：URL模式匹配：匹配 /user/ 后任意非斜杠字符，参数传递：<username> 捕获URL中的值传递给函数，实际应用：用户个人主页、商品详情页等

示例访问：

http://127.0.0.1:8080/user/admin → 显示“用户: admin 的个人主页”。

  

http://127.0.0.1:8080/user/admin/1 → “ 404错误”。

  

4\. 类型转换 - 绑定文章详情函数@app.route('/post/<int:post\_id>')

@app.route('/post/<int:post\_id>')

def show\_post(post\_id):

return f'文章ID: {post\_id} 的内容'

作用：1. 类型验证：确保 post\_id 是整数；2. 自动转换：将字符串参数转换为指定类型。

类型保护：/post/abc 会返回404错误（不是整数）。

支持的类型：

int：整数

float：浮点数

path：包含斜杠的字符串

uuid：UUID字符串

例如访问：

https://127.0.0.1:8080/post/123 → 显示"文章ID: 123 的内容"

  

https://127.0.0.1:8080/post/abc → 404错误

  

https://127.0.0.1:8080/post/→ 404错误

  

4\. 多方法路由 - 绑定API函数

@app.route('/api', methods=\['GET', 'POST'\])

def handle\_api():

if request.method == 'GET':

return jsonify({'method': 'GET请求成功'})

else:

return jsonify({'method': 'POST请求成功'}), 201

作用：HTTP方法区分：同一URL根据请求方法执行不同逻辑；RESTful API设计：符合REST架构风格。

示例：

GET方式：

http://127.0.0.1:8080/api → 获取数据

  

POST方式：

http://127.0.0.1:8080/api → 创建数据

浏览器默认使用GET方法，这里使用Curl命令。状态码控制：POST请求返回201（Created）状态码。

  

返回的内容中出现了Unicode编码的结果，可使用在线网站来翻译对应的中文内容。https://www.jyshare.com/front-end/3602/

  

6\. 路径参数带斜杠

无斜杠通常用于表示一个具体资源或操作；有斜杠表示这是一个“目录”或资源集合。

\# /photos "拍照"这个功能按钮

@app.route('/photos')

def take\_photo():

return "📸 点击这里拍照"

\# 访问结果：

\# /photos ✅ 显示内容

\# /photos/ ❌ 404错误

  

  

\# /photos/ "所有照片"的列表

@app.route('/books/')

def view\_books():

return '''

📁 你的所有书：

\- 书1.jpg

\- 书2.jpg

\- 书3.jpg

'''

  

\# 访问结果：

\# /books ⚠️ 自动301重定向到 /books/

\# /books/ ✅ 显示内容

1.3.4 Flask文件目录结构

Flask项目结构/

│

├── app.py # 主应用文件

├── xxx.py # 自定义功能模块

├── requirements.txt # 依赖列表

├── static/ # 静态文件

│ ├── css/ #CSS样式文件

│ ├── js/ #JS样式文件

│ └── images/ #图片

└── templates/ # 模板文件

└── index.html #html文件

app.py 是Flask应用的入口和核心控制文件，它负责：

1\. 创建Flask应用实例 - 初始化整个Web应用

2\. 配置路由和视图函数 - 定义URL与处理逻辑的映射关系

3\. 整合各个模块 - 导入并使用xxx.py中的自定义功能

4\. 启动开发服务器 - 运行Flask应用

与其他文件的关系：

1\. 调用 xxx.py 中的业务逻辑和工具函数

2\. 渲染 templates/ 中的HTML模板并返回给客户端

3\. 引用 static/ 中的CSS、JS、图片等静态资源

4\. 依赖 requirements.txt 中列出的Python包运行

简单说：app.py像是项目的大脑，它接收请求、协调各模块工作、返回响应，将MVC架构中的Controller（控制器）角色。

1.3.5 Flask模板渲染与重定向

上面我们举的例子都是页面返回字符串，但是真实环境中，网站返回的是网页。Flask中的网站页面使用的是HTML文件，HTML（超文本标记语言）是构建所有网页和网络应用最基础、最核心的骨架代码。

超文本：指的是它不仅包含文字，还能包含链接，可以跳转到其他文档、图片、视频等，形成一个互联的“超”网络。

标记语言：它不是编程语言，而是一种用标签来“标记”内容的语言。标签用来告诉浏览器某段内容是什么（比如是标题、段落还是图片）。

HTML使用由尖括号 < > 包围的标签来工作。标签通常是成对出现的但也有非成对的，如：

<p> 和 </p> 定义了一个段落。

<strong> 和 </strong> 定义重要文本，通常显示为加粗。

<a> 中可定义一个超链接，href 属性指定了链接地址。

<img> 定义了一张图片，src 属性指定了图片来源，alt 是替代文本。

每个HTML网页都遵循一个标准结构，这里使用VS Code创建一个HTML文件。

在html.html中写入以下内容：

<!DOCTYPE html> <!-- 声明文档类型为HTML5 -->

<html lang="zh-CN"> <!-- 根标签，lang属性定义语言为中文 -->

<head>

<!-- 头部：包含元信息，不直接显示在页面上 -->

<meta charset="UTF-8"> <!-- 定义字符编码，防止乱码 -->

<title>我的第一个网页</title> <!-- 浏览器标签页上显示的标题 -->

<link rel="stylesheet" href="style.css"> <!-- 链接外部CSS样式表 -->

</head>

<body>

<!-- 主体：所有显示在网页上的内容都放在这里 -->

<h1>这是一个一级标题</h1>

<p>这是一个段落，包含一个<a href="http://www.baidu.com" target="\_blank">链接</a>。</p>

<img src="logo.png" alt="网站Logo">

<script src="script.js"></script> <!-- 链接外部JavaScript文件 -->

</body>

</html>

右击html.html文件，点击打开方式，选择任意浏览器打开。

HTML、CSS、JavaScript关系

1\. HTML： 结构与骨架

角色：盖房子的砖瓦和钢筋。它定义了网页有什么内容，以及这些内容的基本结构。

功能：创建段落、标题、图片、链接、列表、表格等元素。它搭建出网页的“毛坯房”。

比喻：

</h1> 是房子的门牌（标题）。

<p> 是房间里的一段文字。

<img> 是墙上挂的一幅画。

<a> 是通往另一个房间的门（链接）。

没有它：网页将没有任何内容，一片空白。

2\. CSS： 外观与装修

角色：房子的装修和装饰。它负责让网页变得美观。

功能：控制HTML元素的颜色、字体、大小、间距、背景、布局（如并排、居中）等所有视觉样式。

比喻：

把标题 </h1> 刷成红色，字体变大。

把段落 </p> 的文字调成舒适的灰色和行高。

把图片 </img> 加上一个圆角边框和阴影。

决定客厅（一个区域）和卧室（另一个区域）如何并排布局。

没有它：网页会像一份没有任何格式的纯文本文档，只有最基本的结构，非常丑陋。

3\. JavaScript： 功能与交互

角色：房子的水电、智能系统和管家。它让网页“动”起来，能响应用户。

功能：实现所有动态功能和交互逻辑。例如：点击按钮弹出菜单、轮播图自动切换、表单验证、从服务器获取新数据并更新页面部分内容等。

比喻：

按下电灯开关（点击按钮），灯就亮了（显示/隐藏内容）。

门铃响了（事件触发），你去开门（执行函数）。

恒温器（JS逻辑）根据室温自动调节空调（动态更新页面数据）。

管家（JS）可以根据你的指令，从仓库（服务器）取一件新家具（数据）放进房间（更新DOM）。

没有它：网页是静态的、无法交互的“宣传册”，用户只能看，不能进行任何操作。

模板渲染是将数据嵌入HTML后返回给用户，而重定向是让浏览器自动跳转到另一个URL地址。

模板渲染：服务器生成完整HTML → 用户看到新内容（URL地址不变）

重定向：服务器返回“跳转指令” → 浏览器请求新地址 → 用户看到新内容（URL地址变化）

核心区别：渲染是直接给结果，重定向是让浏览器换个地方要结果。

Flask中一般使用下面的三个函数控制返回的html页面:

函数

作用

返回值

常见使用场景

render\_template()

渲染指定的HTML模板文件

HTTP响应（HTML页面）

显示页面内容

redirect()

重定向到其他URL

HTTP重定向响应

页面跳转、表单提交后

url\_for()

根据视图函数名生成URL字符串

字符串（URL）

在模板或代码中生成链接

通过下面的简单例子来解释上面三个函数的使用方法，假设Flask项目结构、app.py、hello.html文件内容如下：

├── app.py

└── templates/

└── hello.html

app.py

from flask import Flask, render\_template, redirect, url\_for

app = Flask(\_\_name\_\_)

@app.route('/nihao/')

@app.route('/nihao/<name>')

def saynihao(name=None):

\# 如果没有传入name参数，使用默认值"小明"

if name is None:

name = "小明"

return render\_template('hello.html', name=name)

\# 重定向1：使用固定参数

@app.route('/gonihao')

def go\_nihao():

\# 重定向到/nihao/小红

return redirect('/nihao/小红')

\# 重定向2：使用url\_for带参数

@app.route('/gosayhello')

def go\_sayhello():

\# 重定向到/nihao/小刚

return redirect(url\_for('saynihao', name='小刚'))

if \_\_name\_\_ == '\_\_main\_\_':

app.run(host='0.0.0.0', port=8080,debug=True)

hello.html

<!DOCTYPE html>

<html>

<body>

<h1>你好，{{ name }}！</h1>

<p>这是一个最简单的Flask页面</p>

<!-- 方法1：通过查询参数传递 -->

<a href="{{ url\_for('saynihao', name='小东') }}">点击回到首页（小东）</a>

</body>

</html>

使用Python运行app.py，访问效果如下：

1\. 访问http://127.0.0.1:8080/nihao/，若未接收到参数将使用默认参数值，该案例中的默认参数值是"小明"。

  

2\. 假如指定参数为"小李"，如访问：http://127.0.0.1:8080/nihao/小李

  

3\. 访问http://127.0.0.1:8080/gonihao

  

4\. http://127.0.0.1:8080/gosayhello

  

5\. 点击“点击回到首页（小东）“

  

1.3.6 Flask模板继承

Flask中的模板继承是一种DRY（Don't Repeat Yourself）的设计模式，它允许你创建一个基础模板（base template）来定义网页的通用结构（如页头、导航栏、页脚等），然后让其他子模板继承这个基础模板并只填充各自独特的内容区域。这就像制作印章：基础模板是印章的底板，定义了固定不变的边框和样式；子模板则是每次盖章时填入的不同文字内容。通过使用{% block %}标签在基础模板中定义可替换的内容块，子模板用{% extends %}声明继承关系后，只需用相同的{% block %}标签重写需要变化的部分（如页面主体），而无需重复编写整个HTML结构。这样既保持了网站风格的一致性，又大大减少了代码重复，让维护和修改变得更加高效。

通过下面案例来讲解Flask中模板基础，假设Flask项目结构：app.py、base.html、home.html、about.html如下所示，在base.html中定义了一个网站的导航栏，网站的所有页面中都需要使用这个导航栏，那么在该网站的其他HTML页面只需要使用{% extends "base.html" %}就能直接导入这个导航栏，不同的是，除过导航栏一样，页面中的内容可使用{% lock %}和{% endblock %}实现自定义效果。

flask\_template\_demo/

├── app.py

└── templates/

├── base.html # 基础模板

├── home.html # 首页（继承base）

└── about.html # 关于页面（继承base）

app.py

from flask import Flask, render\_template

app = Flask(\_\_name\_\_)

@app.route('/')

def home():

return render\_template('home.html')

@app.route('/about')

def about():

return render\_template('about.html')

if \_\_name\_\_ == '\_\_main\_\_':

app.run(host='0.0.0.0', port=8080,debug=True)

templates/base.html（基础模板）

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>简单的Flask网站</title>

<style>

body {

margin: 0;

font-family: Arial;

}

.nav {

background: #333;

padding: 10px;

}

.nav a {

color: white;

margin: 0 15px;

text-decoration: none;

}

.content {

padding: 30px;

min-height: 400px;

}

.footer {

background: #333;

color: white;

text-align: center;

padding: 15px;

}

</style>

</head>

<body>

<!-- 导航栏 - 所有页面都一样 -->

<div class="nav">

<a href="/">🏠 首页</a>

<a href="/about">📖 关于</a>

<a href="#">📞 联系</a>

</div>

<!-- 内容区域 - 子页面会改变这里 -->

<div class="content">

{% block content %}

<!-- 子模板的内容会放在这里，实现不同页面不同的内容效果。-->

{% endblock %}

</div>

<!-- 页脚 - 所有页面都一样 -->

<div class="footer">

<p>© 2026 我的网站 | 底部导航</p>

</div>

</body>

<html>

templates/home.html（首页 - 继承base）

{% extends "base.html" %}

{% block content %}

<h1>欢迎来到首页</h1>

<p>这是网站的主页面。</p>

<p>我只写了内容，导航和页脚都是base.html提供的。</p>

<h2>特点：</h2>

<ul>

<li>导航栏自动显示</li>

<li>页脚自动显示</li>

<li>我只需关注内容</li>

</ul>

{% endblock %}

templates/about.html（关于页面 - 继承base）

{% extends "base.html" %}

{% block content %}

<h1>关于我们</h1>

<p>这是关于我们的页面。</p>

<h2>联系我们：</h2>

<p>邮箱：example@email.com</p>

<p>电话：123-456-7890</p>

<h2>办公时间：</h2>

<p>周一至周五：9:00-18:00</p>

{% endblock %}

效果示例：

  

1.3.7 HTML实践作业

📝 任务要求: 创建个人学习笔记页面

请使用Flask创建一个关于Web开发学习的个人笔记页面。页面需包含以下所有元素：

1\. 不少于3个路由，且必须包含动态路由；

2\. 不少于3个HTML页面，必须包括默认页面，且不少于10种标签，页面之间能相互跳转，页面中必须包括超链接、图片、title等标签；

3\. 需要使用到Flask重定向功能；

4\. 需要使用到Flask模板继承功能。

1.4 Git工具

Git是一个开源的分布式代码、文档管理系统，常用于团队协作，本实验用通过Git获取实验代码。它通过记录文件快照的方式来追踪项目内容的变更，允许开发者在本地拥有完整的代码仓库和历史记录，从而支持灵活的离线工作、高效的分支创建与合并，是现代软件开发中不可或缺的协作与版本管理工具。

下载地址：https://git-scm.com/

  

  

  

双击Git-2.52.0.-64-bit.exe，都选择默认点击下一步就行。

  

  

  

  

  

  

  

安装完成后，在任意文件夹中的空白位置，可以看到鼠标右键菜单增加了两个关于Git的选项。

同时，Git指令已被加入环境变量，可在任意终端被识别。点击 Open Git Bash here。

  

在Git Bash中可执行linux相关命令，也就是说在Windows上通过Git Bash能实现执行Linux的效果。例如下面的id（查看用户和组信息）命令原本只能在Linux/Unix 系统上执行。

  

除了通过点击Open Git Bash here，还可以在CMD中直接Git命令进行操作，使用Git克隆Github或Gitee（中国版Github）中的项目：

\# git clone https://<项目名称>.git

例如: 使用Git克隆Github中一个叫flask的项目。

  

由于当前执行命令的路径是C:\\，所以下载完成后在C:\\中就能看到flask的文件夹。

  

1.5 从DataCon竞赛平台获取实验所需云服务器

DataCon是由清华大学和奇安信联合发起的面向高校学生和数据安全分析爱好者的专业数据安全竞赛社区。本次活动学生所需使用的服务器通过DataCon平台获取、管理。

1.6.1 平台注册

平台地址：https://www.datacon.org.cn/

首页：接受必需项，点击注册，进行账号注册。

  

注册方式支持：手机号注册，邮箱注册。

输入账号名，密码，手机号验证码，即可注册账号。同时也支持邮箱注册，点击邮箱注册可以进行切换。

  

注册成功后，使用注册账号，登录平台。

1.6.2 报名赛事

点击所有赛事，查看待参与赛事。

选择参与赛事：以现场公布的赛事名称为准。

通过报名连接，也可以直接访问赛事报名页面

报名链接以最新公布为准。

点击立即报名，进入战队信息填写弹窗

战队名称，战队logo为必填。其他字段，可根据实际情况进行填写。报名成功后，在页面即可见自己的战队。

  

  

1.6.3 赛事系统

比赛开始后，即可在赛事系统中，题目的描述里，查看到自己分配到的云服务器地址。

具体操作如下：

1\. 点击【进入比赛】

  

2\. 在赛事系统页点击赛题解答

  

3\. 进入赛题解答页后，点击赛题，弹出赛题弹框

  

4\. 出现赛题弹框后，点击赛题解答，进入赛题解答页面

  

5\. 点击打开虚拟环境，获取虚拟环境，这个过程可能页面需要加载一分钟，出现终端样式时，加载成功。

  

6\. 点击页面ssh按钮，可以查看云服务器的IP地址，连接账号，连接密码，通过终端进行云服务器连接

  

  

  

7\. 虚拟环境操作页，支持重启，关机云服务器，点击上方的重启，关机，重置登录密码。

  

1.6 阿里云服务器购买

阿里云服务器（ECS，Elastic Compute Service）是阿里巴巴集团旗下阿里云提供的核心云计算服务之一，它是一种安全可靠、弹性可伸缩的云端虚拟服务器。用户可以根据业务需求灵活选择CPU、内存、操作系统和网络配置，并实现分钟级快速部署与按需付费，有效降低IT成本。ECS不仅提供高性能计算能力、多种实例规格和丰富的镜像选择，还集成了云硬盘、安全组、快照备份等企业级功能，广泛应用于网站搭建、应用开发、数据处理、企业服务等高可用、高弹性的计算场景，是企业与开发者上云实现数字化转型的基础设施支撑。

本次课程中服务器是直接由DataCon平台提供，实验结束后即失效。本次活动结束后学生如果想要维持网站长期使用，可自行购买云服务器，访问阿里云官网（https://www.aliyun.com/），登录账号后，在控制台页面中选择“产品与服务”下的“云服务器ECS”。在ECS页面中，点击“立即购买”按钮，进入购买页面。注：除了阿里云还有腾讯云等公有云平台，完成学生认证后通常可享受优惠,如有需求可自行进一步了解。

  

根据自身需求购买对应的项目。

  

2 域名配置

域名就像是互联网上的“门牌号”或“地址簿”，它的功能是将复杂难记的IP地址（如192.168.1.1）转换为简单易懂的英文单词组合（如baidu.com），方便人们快速访问网站。它的核心作用是建立用户与网站服务器之间的桥梁，确保用户输入域名后能准确找到对应的网络资源。同时，域名还承载着品牌标识、专业形象和信任度，是企业或个人在数字世界中的重要身份象征。

  

2.1 域名注册

NameSilo是一家在国际上广受好评的域名注册商，其核心吸引力在于价格长期稳定透明、无隐藏费用，并且坚持为绝大多数域名免费提供终身WHOIS隐私保护，免去了用户额外的订阅成本与信息泄露的担忧。平台界面设计直观简洁，专注于提供域名注册、管理和转让等核心服务，操作体验流畅高效。凭借高性价比和可靠的客户支持，NameSilo成为了个人开发者、初创企业及注重隐私与预算的用户的首选注册商之一。

官方网站：https://www.namesilo.com

2.1.1 用户注册

  

注册：https://www.namesilo.com/sign-up?redirect=%2F

  

2.1.2 域名挑选

选择不同的域名和后缀，会有不同的价格，作为实验使用，建议限制价格在3美元以下，如挑选的域名关键词价格都比较高的情况下，建议选择其它关键词再次搜索。

注意：本实验手册中，将以0xse.cc作为演示，学生在实验操作中，请替换为自己的域名。

  

2.1.3 域名支付

  

  

点击更多选项，在更多选项中选择支付宝支付。

  

  

  

请记录以下信息：

域名

价格（元）

付款人

2.2 域名解析配置

域名解析配置，本质上是为你的域名（如 example.com）在互联网“电话簿”（即DNS系统）中设置对应的联系地址。因为互联网上的所有服务器和设备最终都通过一串数字形式的IP地址（如 192.0.2.1）来互相定位和通信，而人类难以记忆这些数字。所以，我们需要将便于记忆的域名“翻译”成机器能识别的IP地址，这个过程就是域名解析。通过配置解析记录，当用户访问你的域名时，DNS系统就能准确地将他们引导至存放你网站内容的目标服务器，从而实现网站的访问。

2.2.1 域名管理

进入域名管理页面：https://www.namesilo.com/account\_domains.php。

  

初次配置域名信息需要进行邮箱验证。

https://www.namesilo.com/account\_contacts\_email\_verification.php

  

在注册时填写的邮箱中，点击连接并输入验证码。

  

  

2.2.2 IP地址解析

进入配置页面，将默认的IP替换为自己阿里云服务器的IP地址，本实验手册中将以 8.217.110.77为例，学生在实验中请替换为自己分配到的IP，后续可参考 1.5 章节自行购买阿里云服务器进行绑定。

  

提交配置后一般需要10分钟时间生效，有时可能需要更久。

2.2.3 域名配置生效检测

Windows上：

在cmd终端输入nslookup指令：如果能正确返回IP地址则说明上面的配置已经生效。

\# nslookup <自己注册的域名>

  

Linux上：

使用dig命令查询域名解析结果。

\# dig <自己注册的域名>

  

使用在线检测平台：https://toolbox.googleapps.com/apps/dig/#A/

  

2.3 DNS缓存清理

清理DNS缓存是为了确保在测试域名解析时，能够获取到最新、最准确的DNS记录，而不是之前缓存的旧数据。 当我们修改DNS配置（如更换服务器IP、调整CDN设置或修复解析问题）后，旧的DNS记录可能仍被浏览器、操作系统或网络设备缓存着，导致测试时看到的是过时的结果，无法验证更改是否真正生效。只有清理了这些多级缓存（包括浏览器缓存、系统缓存、路由器缓存等），才能强制系统重新向DNS服务器查询，从而获得真实的解析结果，确保测试的有效性和问题的准确排查。

2.3.1 缓存层次机构

┌───────────────────────────────┐

│ 浏览器DNS缓存 │ ← 第一级（最快过期）

├───────────────────────────────┤

│ 操作系统DNS缓存（系统级） │ ← 第二级

├───────────────────────────────┤

│ 路由器/本地DNS服务器缓存 │ ← 第三级（影响局域网）

├───────────────────────────────┤

│ ISP（网络提供商）DNS缓存 │ ← 第四级（TTL较长）

├───────────────────────────────┤

│ 公共DNS服务器缓存（如8.8.8.8） │ ← 第五级

├───────────────────────────────┤

│ 权威DNS服务器 │ ← 最终来源

└───────────────────────────────┘

需要注意：浏览器应用程序（如Chrome、Firefox）有自己的DNS缓存，单单清空系统缓存不影响它们，如果需要清空浏览器缓存，需要在浏览器设置中单独操作。

作为当前实验学生，我们只有权力改动本地浏览器缓存和操作系统缓存。虽然我们能在域名配置中修改具体的TTL（Time To Live，生存时间），但是有的平台会有最低门槛设定，如当前使用的Namesilo平台最小TTL为3600秒。以及如果设置极短的TTL时，中间DNS缓存系统（网络提供商、公共DNS服务器）可能不遵守设定的较小TTL值，而是替换为它们认为合理的最小值。

2.3.2 Windows系统缓存清理

按 Win + R，输入 cmd，回车：

  

使用以下命令清理系统DNS缓存记录，看到“成功刷新DNS解析缓存”提示即完成。

\# ipconfig /flushdns

  

2.3.3 Linux系统缓存清理

使用以下命令清理系统DNS缓存记录，看到“Current Cache Size: 0”提示即完成。

\# resolvectl flush-caches

\# resolvectl statistics

  

2.3.4 Chromium内核浏览器

Chrome / Edge（Chromium内核）通过地址栏

在地址栏输入并访问：chrome://net-internals/#dns

点击 "Clear host cache" 按钮

额外步骤：还需要清除Socket池

在地址栏输入：chrome://net-internals/#sockets

点击 "Flush socket pools"

  

2.3.5 Firefox浏览器

Firefox通过配置页面

在地址栏输入并访问：about:config

搜索 network.dnsCacheExpiration

双击将值临时改为 0（清空后建议改回默认值60）

或者搜索 network.dnsCacheEntries，设为 0

  

2.3.6 Safari (MacOS)

打开Safari，点击菜单栏 Safari > 偏好设置

进入 "高级" 选项卡

勾选 "在菜单栏中显示开发菜单"

从菜单栏选择 "开发" > "清空缓存"

3 网站搭建

将代码部署到公网上是为了构建一个可公开访问、持续运行的真实应用环境。在本地开发时，应用仅能在个人设备上运行和测试，功能与性能受本地资源限制，且无法模拟多用户并发访问、真实网络延迟及跨设备兼容性等实际场景。部署至阿里云服务器后，学生能够获得一个稳定的线上运行环境，便于通过任意网络和设备随时访问和测试项目功能，也为后续集成更复杂的数据处理、用户交互及扩展服务提供了必要的实践基础，使学习过程更贴近实际生产部署流程。

在前面的Flask学习课程已经详细的介绍了Flask的基础知识，本模块将会直接提供本课程实验的项目代码，学生需要部署到自己的阿里云服务器上方可进行后续课程内容（口令安全、AI安全）。

项目地址：https://gitee.com/xsecc/qhfz

3.1 服务器上部署项目代码

提供以下三种方法：Git克隆、VS Code上传、SCP远程传输。

3.1.1 Git克隆（推荐）

直接在服务器上使用Git克隆Github项目：

https://gitee.com/xsecc/qhfz.git

  

3.1.2 VS Code上传

可先将项目下载到本地，然后通过在VS Code中拖拽方式，将项目代码上传到服务器指定位置。

访问：https://gitee.com/xsecc/qhfz

  

  

  

3.1.3 SCP远程传输

SCP（Secure Copy Protocol） 是一个基于 SSH 的安全文件传输协议，用于在本地计算机和远程服务器之间，或者两个远程服务器之间安全地复制文件。

\# scp -r < folder\_name> <username>@<server\_ip>:<path>

输入密码：

  

3.2 服务器安装Flask

因为Flask本身是一个Python第三方库，而不是操作系统内置的可执行程序。当我们将开发好的Flask应用代码从本地计算机迁移到全新的服务器时，该服务器默认只有纯净的Python环境，并不包含项目所依赖的Flask库及其相关组件。如果在服务器上直接运行包含import flask的代码，Python解释器会因为找不到这个模块而报错、无法启动应用。因此，必须通过pip install flask等命令在服务器上安装完全相同的Flask环境，才能为应用程序提供运行所需的依赖支持，这和我们在本地开发时第一步要安装Flask是同一个道理。

服务器已经部署python3和pip，可直接使用pip进行安装。

\# pip install flask

  

3.3 启动网站

将开发完成的网站代码部署并运行在服务器上，使其成为一个可以通过网络访问的在线服务。其根本目的是将静态代码或本地应用转化为一个持续对外提供服务的公共端点，以便用户、测试人员或相关系统能够通过浏览器或API进行访问与交互。这不仅是为了完成功能验证和调试（常采用“临时运行”方式），更是为了实现服务的稳定、可靠与持久可用，从而支撑真实世界的业务需求。为此，在正式生产环境中，必须使用持久化运行方案（如Tmux会话守护、系统服务封装或容器化部署），确保服务器进程不会因终端断开而中断，以保障服务的连续性与可靠性。

3.3.1 临时运行

一般在调试和测试版中，为方便查看与验证，选择临时运行的方式，这种方式的问题在于一旦断开终端连接，运行的服务器也就会中断。

在前面案例中就是使用的临时运行，但要想持久对外提供服务还行额外操作。

  

3.3.2 持久化运行

Tmux（Terminal Multiplexer）是一款终端复用软件，它允许你在一个终端窗口中创建、管理和切换多个持久化的虚拟终端会话。即使关闭SSH连接或终端窗口，会话仍在后台运行，随时可重新接入。它的核心功能包括分屏（将窗口划分为多个窗格）、会话管理（保存工作环境）和窗口标签（像浏览器标签页一样管理多个终端任务），特别适合远程服务器开发、运维和需要长时间运行任务的后台场景。

Tmux常见使用命令如下，更多用法请自行了解。

tmux new -s <sessionname>　创建名为sessionname（可自定义）的会话

tmux ls　显示会话列表

tmux a　　连接上一个会话

tmux a -t <sessionname>　连接指定会话

tmux rename -t s1 s2　　重命名会话s1为s2

tmux kill-session　　关闭上次打开的会话

tmux kill-session -t s1　　关闭会话s1

tmux kill-session -a -t s1　　关闭除s1外的所有会话

tmux kill-server　　关闭所有会话

常用快捷键:

Ctrl+b d 离开当前会话（最常用，相当于最小化）

Ctrl+b x 删除当前会话（最常用，相当于关闭）

Ctrl+b s 列出会话，可进行切换

Ctrl+b a -t number 其中number是 tmux ls 获取的序列号 从0 开始

使用举例：

前期已将项目上传至服务器的 /root/QHFZ 路径下，接下来在该路径中创建Tmux新会话，并设定会话名称，假设新的会话名称叫 “QHFZ”：

\# tmux new -s QHFZ

  

在该会话中运行python3 app.py

  

退出当前会话时，快捷键：先按Ctrl+b，后按 d

为增加Tmux演示效果，可额外再创建一个叫 “TEST”的会话。

查看当前系统运行的Tmux会话列表：

\# tmux ls

  

可以看到当前系统中存在两个刚才创建的Tmux会话： QHFZ和TEST。下面以终止 QHFZ 会话为例，演示如何销毁创建的Tmux会话。

\# tmux kill-session -t TEST

  

3.4 Nginx配置

Nginx是一款高性能的Web服务器和反向代理服务器软件，其核心作用是高效、稳定地处理网络访问请求。它可以直接托管网站文件（如HTML、图片），响应用户的浏览器访问；更重要的是，它常作为“智能交通调度员”，充当反向代理，接收用户请求后，将其转发给后端的多个应用服务器（如Java、Python程序），并将结果返回给用户，从而实现负载均衡、提升并发处理能力与系统安全性。同时，Nginx还能提供缓存加速、SSL/TLS加密（HTTPS）等关键功能，是现代网络架构中至关重要的基础组件。

  

3.4.1 Nginx安装

查看当前可安装nginx版本

\# apt list –a nginx

Nginx安装

\# apt install nginx –y

查看nginx安装版本

\# nginx -V

验证ssl模块

\# nginx -V 2>&1 | grep -- '--with-http\_ssl\_module'

  

3.4.2 Nginx配置验证与生效

验证Nginx是否存在配置方面的语法错误。

\# nginx –t

  

重新加载Nginx配置项。

\# nginx –s reload

  

如果加载nginx配置文件失败，可尝试重启Nginx服务

\# systemctl restart nginx

  

3.4.3 Nginx默认页面

Nginx默认使用80端口，若80端口已被占用则会启动失败，成功启动后，直接访问就能看到Nginx的默认页面。

  

3.4 HTTPS配置

HTTPS 是在 HTTP 协议基础上，通过加入 SSL/TLS 加密层 来实现安全通信的网络协议。它的核心作用是在客户端（如浏览器）和服务器之间建立一个加密通道，对传输的数据进行加密和完整性保护，有效防止窃听、篡改和中间人攻击；同时通过数字证书进行身份认证，确保用户访问的是真实、可信的服务器（而非钓鱼网站）。这使得 HTTPS 成为当今网站保障用户隐私和数据安全（如登录凭证、支付信息）的基础性安全标准，也是浏览器标识网站可信度的关键指标（地址栏显示锁形图标）。

3.4.1 Certbot安装

Certbot 是一个免费、开源的自动化工具，主要作用是为网站自动获取、部署和续期 Let's Encrypt 颁发的 SSL/TLS 证书，从而将网站的 HTTP 连接升级为加密的 HTTPS 连接，保障数据传输安全。它通过简化的命令行交互，自动完成域名验证（如 DNS 或 HTTP 挑战）、证书申请、Web 服务器（如 Nginx、Apache）配置更新等复杂流程，并内置定时任务自动续期证书，彻底解决了传统 SSL 证书昂贵、手动操作繁琐和易过期的问题，是推行全站 HTTPS 的标配工具。

在安装Certbot前需要更新apt，避免本地apt包中没有Certbot。

\# apt update

安装certbot工具。

\# apt install certbot -y

通过查看安装版本确认certbot是否安装成功。

\# certbot --version

  

3.4.2 SSL/TLS证书申请

方式一：

手动模式申请证书，注意，本书中出现的0xse.cc域名为演示域名，学生在实际操作时需要更换为自己购买的域名。

\# certbot certonly --manual --preferred-challenges=dns -d "www.0xse.cc" --server https://acme-v02.api.letsencrypt.org/directory

  

注意!!!：当看到出现挑战码时先不要按回车健。此时需要在域名管理平台发布相应的内容。

从这个提示信息中能看得出来，需要将 \_acme-challenge.www.0xse.cc的DNS TXT记录配置为：ZDQ2aL1lOXXu9NTULvh2wayC\_BWDh\_IDjpgNmRY-K

此时需要回到域名配置页面

https://www.namesilo.com/account\_domains.php。

  

根据提示要求，新增DNS记录，类型选择TXT，名称填写 \_acme-challenge.www,文本内容写入指定值：

ZDQ2aL1lOXXu9NTULvh2wayC\_BWDh\_IDjpgNmRY-K

点击提交。注意，学生在操作这一步时需根据自己的实际值进行填写。

  

提交发布后，还需要持续等待约10分钟左右使配置记录能在全球生效，等待过程中，可在本机进行测试。

\# 通过以下3种方式查看\_acme-challenge是否更新

\# nslookup -type=txt \_acme-challenge.www.0xse.cc

\# dig \_acme-challenge.www.0xse.cc TXT

https://toolbox.googleapps.com/apps/dig/#TXT/\_acme-challenge.www.0xse.cc注意：www.0xse.cc为示例域名，实际操作中请使用自己申请的域名。

  

本过程中，可能受到本地DNS缓存记录影响，导致刷新后未获得最新记录，可参考2.3 DNS缓存清理 进行清理缓存。

当检测到TXT记录生效后方可按回车按钮继续完成证书申请，此过程中一旦申请失败可申请其他子域名。因为即使再次申请相同域名的证书，每次的挑战码都不一致，重新提交挑战码后，旧的挑战码短期内依旧未在互联网中被彻底更新，需要等待很久的时间才是彻底更新完。

  

此时可以看到成功申请到的证书保存地址为：/etc/letsencrypt/live/<申请域名>文件夹下，其中privkey.pem是私钥文件，fullchain.pem是完整证书链文件，它包含了公钥，但不仅仅是公钥。

注：如果方式一短期难以完成，可通过方式二尝试。

方式二：

Standalone 模式是 Certbot 的一种工作模式，它会临时启动一个内置的 Web 服务器来处理 Let's Encrypt 的验证挑战。

工作原理：

Certbot 自动启动一个临时的 Web 服务器，监听 80 端口（HTTP-01 挑战）或 443 端口（TLS-ALPN-01 挑战），专门用于响应 Let's Encrypt 的验证请求。自动处理挑战文件，在内存中创建验证文件，Let's Encrypt 访问 http://你的域名:80/.well-known/acme-challenge/xxx，Certbot 的临时服务器直接响应，验证完成后自动关闭。获取证书后，临时服务器自动停止，不会影响你原有的 Web 服务器。

这里以oa.0xse.cc为例，演示方式二。注意：oa.0xse.cc为示例域名，实际操作中请使用自己申请的域名。

  

由于Standalone 模式会占用本地80端口和已安装的Nginx会产生冲突。

先停止Nginx，解除本地80端口的占用。

\# systemctl stop nginx

\# certbot certonly --standalone -d oa.0xse.cc

注意：申请证书完毕后记得重新启动Nginx。

\# systemctl start nginx

3.4.3 流量转发与代理

编辑Nginx 配置文件，现实先将访问本地80端口的HTTP流量转发到443端口的HTTPS上，并使用代理将流量传输到真正的Web服务器（Flask系统的8080端口）上。

这里推荐使用Nano编辑器，常用的快捷键有：

Ctrl + S 保存

Ctrl + K 删除整行

Ctrl + X 退出

使用Nano编辑器，按键盘方向键定位光标，通过键盘输入内容或通过鼠标右键粘贴。

注意：www.0xse.cc为示例域名，实际操作中请使用自己申请的域名。

\# nano /etc/nginx/sites-available/default

server {

listen 80;

listen \[::\]:80;

server\_name www.0xse.cc;

\# HTTP 到 HTTPS 重定向

location / {

return 301 https://www.0xse.cc$request\_uri;

}

}

server {

listen 443 ssl;

listen \[::\]:443 ssl;

server\_name www.0xse.cc;

\# SSL 配置

ssl\_certificate /etc/letsencrypt/live/www.0xse.cc/fullchain.pem;

ssl\_certificate\_key /etc/letsencrypt/live/www.0xse.cc/privkey.pem;

\# SSL 协议和加密套件（安全推荐）

ssl\_protocols TLSv1.2 TLSv1.3;

ssl\_ciphers HIGH:!aNULL:!MD5;

\# 其他配置保持不变

root /var/www/html;

index index.html index.htm index.nginx-debian.html;

\# 反向代理配置

location / {

\# 实验课程中的Flask是运行在8080端口

proxy\_pass http://127.0.0.1:8080;

}

}

验证Nginx配置语法无误后，重新加载Nginx配置项。

  

3.4.4 HTTPS证书验证

在浏览器上访问自己申请的域名，本手册中以www.0xse.cc为例。

以下是Chrom浏览器访问实验网站示意图：

  

  

  

以下是Edge浏览器访问实验网站示意图：

  

  

  

其他类型浏览器查看证书也是点击地址前面的安全标志符号，过程可能略有不同。

3.5 博客网站搭建

Hugo 是一个用 Go 语言编写的现代化静态网站生成器，它能将简洁的 Markdown 文本文件与模板主题相结合，闪电般地生成完整的静态 HTML 网站。它无需数据库或复杂的运行环境，让你专注于内容创作，只需简单编写.md 文档，Hugo 便能自动解析结构、应用布局样式，并输出一套可部署于任何 Web 服务器的轻量级静态文件，是构建博客、文档站或企业官网的高效利器。

3.5.1 Hugo安装

官网地址：https://gohugo.io/

  

在Github上下载hugo可执行文件。

访问：https://github.com/gohugoio/hugo

  

注意!!!,这里选择扩展版（带extended），普通版无法使用第三方主题代码。

  

  

解压该zip压缩包文件，这里以

C:\\hugo\_extended\_0.154.3\_windows-amd64\\ 为例。

  

为在系统任何路径中都能使用到hugo.exe，这里将hugo.exe添加到电脑的系统环境变量中。按win+R 键 输入 sysdm.cpl打开 系统属性。

  

  

选择编辑 系统变量 中的 Path。

  

添加hugo.exe所在的文件路径：

C:\\hugo\_extended\_0.154.3\_windows-amd64\\

  

  

  

3.5.2 创建网站

在CMD命令行中，进入要放置网站的目录，本书以C:\\hugo\_extended\_0.154.3\_windows-amd64\\ 为例，学生请根据自身放置Hugo路径为主，然后运行下面命令创建博客项目文件夹：

\# hugo.exe new site <博客名称>这里以myblog作为博客名为例，学生实际操作中请根据自身情况决定。

  

创建后能看到出现myblog的文件夹。

  

进入myblog文件夹，可以看到基本的项目框架结构如下：

  

hugo.toml 是网站的主配置文件，定义了站点标题、主题、URL等基本设置；archetypes 存放内容模板，用于快速生成具有预设Front Matter的Markdown文件；assets 包含CSS、JavaScript等需要处理的资源文件；content 是网站的核心，所有Markdown格式的文章和页面都存储在这里；data 存放YAML、JSON或TOML格式的配置文件，用于存储全局数据；i18n 存放国际化翻译文件，支持多语言网站；layouts 包含HTML模板文件，控制页面的结构和布局；static 存放直接复制到最终站点的静态文件，如图片、字体和不需要处理的文件；themes 则存放网站主题，包含预设的布局和样式，用户可以选择或自定义主题来改变网站外观。

3.5.3 添加主题

以当前文件路径C:\\hugo\_extended\_0.154.3\_windows-amd64\\ 为例，初始化Git仓库。

\# git init

  

也可使用绝对路径初始化Git仓库，Hugo安装在D盘中。

以D:\\hugo\_extended\_0.154.5\_windows-amd64为例进行初始化Git仓库。

\# git init "D:\\hugo\_extended\_0.154.5\_windows-amd64"

安装主题

方式1：远程命令安装

这里以ananke主题为例，学生可自行选择其他主题，进入刚才创建的myblog文件夹中执行下面命令：

\# git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke

  

当然也可在Gitee中尝试获取，在Gitee官网中搜索：https://so.gitee.com/

  

方式2：手动安装

使用浏览器访问：

https://github.com/theNewDynamic/gohugo-theme-ananke

  

找到最新的版本（如 v2.12.1），点击 Source code (zip) 或类似的压缩包链接进行下载。

  

在myblog\\themes\\ 中，新建名为 ananke 的文件夹，将解压后的文件夹里的所有内容（通常是 archetypes, layouts, README.md 等），都复制到刚刚创建的 myblog\\themes\\ananke\\ 文件夹中。

  

完成后，myblog目录结构应该大致如下：

myblog/

├── themes/

│ └── ananke/ <-- 这是你新建的文件夹

│ ├── layouts/ <-- 主题的核心模板文件应该在这里

│ ├── static/

│ └── theme.toml <-- 主题的配置文件

├── content/

├── hugo.toml

└──...

3.5.4 配置与试运行

打开网站根目录下的 hugo.toml文件，添加启用的主题配置，以及要部署网站的域名和路径：

  

  

最后，在myblog目录中启动本地服务：

\# hugo.exe server

  

当只配置hugo.toml 时，Hugo会使用主题自带的演示效果,如下图所示：

http://localhost:1313/myblog/

  

3.5.5 Hugo目录结构

以接下来使用到的案例为例，Hugo的目录结构主要由以下组成。

myblog/

├── hugo.toml # 配置文件

├── themes/ # 主题目录

├── static/ # 静态文件目录

│ └── images/ # 图片目录

│ └── hugo-logo.png # 图片文件

└── content/ # 内容目录

├── posts/ # 文章目录

│ ├── Hugo快速入门.md # 内容：categories: \["网站搭建"\]

│ ├── 密码安全基础.md # 内容：categories: \["口令安全"\]

│ └── ai安全入门.md # 内容：categories: \["AI安全"\]

├── categories/ # 分类目录

│ └── \_index.md # 分类文件！

└── tags/ # 标签目录

└── \_index.md # 标签文件！

hugo.toml 是Hugo网站的全局配置文件，它启用和配置网站的各类功能。通过在文件中设置\[taxonomies\] category = "categories"来激活分类系统，定义网站的基础参数如标题、主题、URL结构等，并控制所有页面的生成规则和显示方式。

categories是分类系统的展示层，具体表现为content/categories/\_index.md文件及其自动生成的页面。它负责创建分类导航界面，自动聚合所有标记了分类的文章，为每个分类生成独立的列表页面，并提供用户浏览分类内容的入口路径。

tags 是标签系统的展示层，具体表现为 content/tags/\_index.md 文件及其自动生成的页面。它负责创建标签导航界面，自动聚合所有标记了标签的文章，为每个标签生成独立的列表页面，并提供用户通过关键词浏览内容的入口路径。

<文章>.md 是具体的内容文档，位于content/posts/ 目录下。它在文档的YAML头部通过categories: \["分类名"\]字段声明所属分类，当Hugo生成网站时，系统会根据这个声明自动将文章归入对应的分类页面中，同时生成独立的文章浏览页面。

可以把这四者比作图书馆管理系统：hugo.toml 是图书馆馆长，他既规定图书必须按学科分类上架（categories），也要求为每本书建立详细的关键词索引卡（tags）；categories 是图书分类目录牌，展示“计算机类”“文学类”等固定分类标识；tags 则是贴在每本书上的关键词索引卡，记录“Python”“悬疑”“2023出版”等具体主题与属性；而文章.md 就是一本具体图书，它被放在“计算机类”书架上（categories），同时书内附有“Python”和“入门教程”等多张索引卡（tags）。这样，读者既可以通过分类目录牌查找一个大类的图书，也能通过关键词索引卡快速找到所有关联主题的书籍，无论它们属于哪个主分类。

3.5.6 创建博客

接下来使用Hugo工具搭建一个结构清晰、目的明确、专注于学习笔记的博客。

第一步：规划内容结构（分类）

首先，我们来规划知识体系。假如，网站内容分为三个页面：Hugo快速入门、密码安全基础、AI安全入门。

首先，通过hugo.toml设置整体样式，设置网页标题、主题、菜单栏等。修改hugo.toml为：

baseURL = 'https://www.0xse.cc/myblog/'

languageCode = 'zh-cn'

title = '我的博客'

theme = 'ananke'

\# 添加分类配置

\[taxonomies\]

category = "categories" # 重要！

tag = "tags" # 重要！

\# 菜单配置（可选，但建议添加）

\[menu\]

\[\[menu.main\]\]

name = "🏠 首页"

url = "/"

weight = 1

\[\[menu.main\]\]

name = "📂 分类"

url = "/categories/"

weight = 2

\[\[menu.main\]\]

name = "🏷️ 标签"

url = "/tags/"

weight = 3

\# 分页设置

\[pagination\]

pageSize = 10

浏览器访问博客网站，可以看到通过配置hugo.toml，已经改变了默认页面的内容。

http://localhost:1313/myblog/

  

其次，为了对文章进行统一管理和快速定位，继续增加分类和标签管理。

在 myblog/content/ 目录下，创建核心分类文件。

在 myblog 目录下执行：

\# hugo.exe new content categories/\_index.md

  

编辑content/categories/\_index.md

\---

title: "📂 文章分类"

type: "categories"

\---

这里是所有文章的分类列表。点击分类名称查看该分类下的所有文章。

浏览器访问：http://localhost:1313/myblog/categories/，因为还没创建具体的文章，此时还不会出现归类的文章。

  

编辑content/tags/\_index.md

\---

title: "🏷️ 文章标签"

type: "tags"

\---

这里是所有文章的标签列表。点击标签查看该标签下的所有文章。

浏览器访问：http://localhost:1313/myblog/tags/，因为还没创建具体的文章，此时也不会出现归类的标签。

  

第二步：创建博客文章

文章1：Hugo快速入门

\# hugo.exe new content posts/Hugo快速入门.md

  

编辑网站搭建相关文章，注意文章1里面有个配置图片的案例，需要学生在static文件夹中建立一个images文件夹，然后在images文件夹中保存一张名为hugo-logo.png的图片。

  

文章1：Hugo入门教程 (content/posts/Hugo快速入门.md)

\---

title: "Hugo静态网站快速入门指南"

date: 2026-01-10

categories: \["网站搭建"\]

tags: \["hugo", "静态网站", "教程", "入门"\]

description: "从零开始学习使用Hugo搭建个人博客"

featured\_image: "/images/hugo-logo.png"

draft: false

\---

\## 一、Hugo简介

Hugo是一个用Go语言编写的静态网站生成器，以其\*\*速度快\*\*和\*\*简单易用\*\*而闻名。

\### 主要特点

\- ⚡ \*\*极速生成\*\*：生成上千页面只需几秒钟

\- 📝 \*\*Markdown支持\*\*：使用简单的Markdown语法写作

\- 🎨 \*\*主题丰富\*\*：大量开源主题可供选择

\- 🔧 \*\*配置简单\*\*：单个配置文件管理所有设置

\## 二、安装Hugo

\### Windows系统

1\. 访问Hugo GitHub Releases页面

2\. 下载 \`hugo\_extended\_xxx\_windows-amd64.zip\`

3\. 解压得到 \`hugo.exe\` 文件

4\. 放到项目目录或添加到系统PATH

\### 验证安装

./hugo.exe version

\# 显示：hugo v0.154.3+extended

文章2：密码安全基础

\# hugo.exe new content posts/密码安全基础.md

  

\---

title: "密码安全基础"

date: 2026-01-10

categories: \["口令安全"\]

tags: \["密码学", "安全", "加密"\]

description: "了解密码学基础和个人密码管理"

draft: false

\---

\## 一、密码安全重要性

密码是保护数字身份的第一道防线。弱密码会导致隐私泄露和财产损失。

\## 二、密码学基础

\### 1. 哈希函数

\- 单向加密，不可逆

\- 相同输入永远输出相同结果

\- 常见算法：SHA-256、bcrypt

\### 2. 对称加密

\- 同一个密钥加密和解密

\- 常用算法：AES

\- 适用于文件加密

\### 3. 非对称加密

\- 公钥加密，私钥解密

\- 常用算法：RSA、ECC

\- 用于SSL证书、数字签名

\## 三、密码存储安全

\### 禁止的做法

\- 明文存储密码

\- 使用MD5等弱哈希

\- 可逆加密存储

\### 正确做法

\- 加盐哈希存储

\- 使用bcrypt、Argon2等强算法

\- 每个用户不同盐值

\## 四、个人密码管理

\### 强密码规则

\- 至少12位字符

\- 混合大小写、数字、符号

\- 不要用常见词汇

\### 密码工具

\- 密码管理器：Bitwarden、1Password

\- 启用双因素认证

\- 定期更换重要密码

文章3：AI安全入门

\# hugo.exe new content posts/AI安全入门.md

  

\---

title: "AI安全入门"

date: 2026-01-10

categories: \["AI安全"\]

tags: \["人工智能", "机器学习", "安全"\]

description: "了解AI系统面临的安全威胁和防护方法"

draft: false

\---

\# AI安全入门

\## 一、AI安全概述

AI系统面临独特的安全威胁，需要专门防护。

\## 二、主要安全威胁

\### 1. 对抗样本攻击

\- 添加微小扰动误导AI判断

\- 导致错误分类

\- 防御：对抗训练

\### 2. 数据投毒

\- 污染训练数据

\- 影响模型性能

\- 防御：数据清洗

\### 3. 模型窃取

\- 通过API查询复制模型

\- 盗取知识产权

\- 防御：查询限制

浏览器访问：http://localhost:1313/myblog/categories/，此时就能看到个各个类型的文章。

  

浏览器访问：http://localhost:1313/myblog/tags/，此时就能看到各个标签的文章。点击其中的"安全"标签。就能查看所有属于"安全"标签的文章。

  

  

也可逐个访问创建的3个文章页面，浏览器访问页面一：http://localhost:1313/myblog/posts/hugo快速入门/

  

浏览器访问页面二：http://localhost:1313/myblog/posts/密码安全基础/

  

浏览器访问页面三：http://localhost:1313/myblog/posts/ai安全入门/

  

第三步：本地生成HTML文件 public文件夹中保留的是实例化后的HTML文件以及依赖的其他静态文件。由于测试过程中可能会存在残留的旧文件，在最终使用时建议清空public文件夹。

\# rmdir /s public

  

也可直接手动清空。

重新生成public文件夹。

\# hugo.exe server

  

  

3.5.7 通过Nginx部署博客网站

通过3.1 上传网站代码提供的方法 将本地生成的public文件夹上传到服务器的Nginx Web路径（/usr/share/nginx/html/）下，并改名为myblog 。

  

使用以下命令修改/etc/nginx/sites-available/default的配置

nano /etc/nginx/sites-available/default

server {

listen 80;

listen \[::\]:80;

server\_name www.0xse.cc;

\# HTTP 到 HTTPS 重定向

location / {

return 301 https://www.0xse.cc$request\_uri;

}

}

server {

listen 443 ssl;

listen \[::\]:443 ssl;

server\_name www.0xse.cc;

\# SSL 配置

ssl\_certificate /etc/letsencrypt/live/www.0xse.cc/fullchain.pem;

ssl\_certificate\_key /etc/letsencrypt/live/www.0xse.cc/privkey.pem;

\# SSL 协议和加密套件（安全推荐）

ssl\_protocols TLSv1.2 TLSv1.3;

ssl\_ciphers HIGH:!aNULL:!MD5;

\# 其他配置保持不变

root /var/www/html;

index index.html index.htm index.nginx-debian.html;

\# /myblog/ 路径配置

location ^~ /myblog/ {

alias /usr/share/nginx/html/myblog/;

index index.html;

try\_files $uri $uri/ /myblog/index.html;

}

location = /myblog {

return 301 /myblog/;

}

\# 反向代理配置

location / {

proxy\_pass http://127.0.0.1:8080;

}

}

注意：www.0xse.cc为本手册的案例域名，学生实际操作中请替换为自己的域名。

验证Nginx配置语法是否正确，并使配置生效。

  

浏览器访问：https://www.0xse.cc/myblog/

  

3.5.8 搭建自己博客

📝任务要求：

通过上面简单案例，成功的在服务器上搭建了一个博客系统。请同学们根据自己的喜好风格，创建自己的博客。

要求：每天生成一篇学习笔记，并根据笔记内容进行分类，以及为笔记添加标签方便快速定位，可使用AI 美化自己博客的页面样式。

你的观察非常敏锐，直接抓住了这本手册在\*\*“教学逻辑” **与** “工程实践”\*\*之间的最大矛盾点。

针对你的疑问：“已经连了服务器，干嘛还要配置 Windows 环境？”以及“Flask 到 Hugo 是怎么跳跃的？”，我们来做一次深度的 **逻辑解构** 和 **断层分析** 。

---

### 一、 为什么连了服务器还要配 Windows 环境？（逻辑与槽点）

这就好比： **你已经租了一间毛坯房（服务器），房东给了你一把钥匙（Web终端），但手册非要逼你在自己家里（Windows）先造好家具，再雇车拉过去。**

#### 1\. 这种设计的逻辑（“Local-First” 开发模式）

手册遵循的是一种传统的开发流程：

- **本地开发（Dev）：** 在 Windows 上写代码、跑测试（1.1 - 1.3 章节）。
- **代码同步（Sync）：** 用 Git 把代码推送到仓库（1.4 章节）。
- **远程部署（Prod）：** 在服务器上把代码拉下来运行（3.1 章节）。

**它的逻辑闭环在于：** 哪怕没有服务器，你也可以在本地写代码。服务器只是运行环境，不是开发环境。

#### 2\. 现实的槽点（工具链的割裂）

你质疑的点在于，既然手册后文（1.2.3 章节）都教了 **VS Code Remote-SSH** 插件：

- **现代做法：** 直接用 VS Code 连上服务器，把服务器当成开发环境。Python、Hugo 全装在服务器上，本地 Windows **什么都不用装** ，只装一个 VS Code 即可。
- **手册做法：** 非让你在 Windows 装一遍 Python/Hugo，再去服务器装一遍 Python/Nginx。
	- **代价：** 学生要处理两套环境的差异（比如 Windows 的路径是 `\` ，Linux 是 `/` ；环境变量配置方式不同）。
	- **结论：** 这是一个 **严重的教学冗余** 。它既想教本地开发，又想教远程连接，结果两头都没讨好，增加了环境配置报错的概率。

---

### 二、 文档逻辑梳理与“割裂点”分析

这份文档试图把三个完全不同的技术栈（Python Web、运维、静态博客）强行揉在一起。以下是逻辑链条及其断裂处：

#### 逻辑链条：

1. **造车（Flask）：** 学 Python，写个动态网站。
2. **修路（Infra）：** 买服务器，买域名。
3. **上路（Deploy）：** 把车搬到路上跑（Nginx + HTTPS）。
4. **贴海报（Hugo）：** 突然想在车上贴个广告画（静态博客）。

#### 割裂点 1：从 Flask 到 Hugo 的突兀跳转

- **现象：** 学生刚学会写 `app.route('/hello')` （动态逻辑），突然画风一转去装 Hugo（生成静态 HTML），两者在代码层面 **没有任何关系** 。
- **本质：** 这是一个\*\*“拼盘式”\*\*教学。
	- **Flask** 负责后端逻辑（处理 API、数据库）。
	- **Hugo** 负责内容展示（生成纯 HTML 文件）。
	- **连接点：** 唯一的连接点是 **3.5.7 章节的 Nginx 配置** 。
- **技术上的“胶水”：** Nginx 被配置成了“分流器”：
	- 访问 `www.xxx.com/` 转发给 Flask (8080端口)。
	- 访问 `www.xxx.com/myblog/` 读取 Hugo 生成的静态文件目录。
	- **割裂感来源：** 手册没有解释这种架构的意义（即“动静分离”），导致学生觉得 Hugo 是横插进来的一块内容。

#### 割裂点 2：理论与实践的脱节（“玩具级”运维）

- **服务守护（Tmux vs Systemd）：**
	- **理论：** 服务器上的网站应该一直运行。
	- **手册实践：** 用 `tmux` 开个窗口挂着。
	- **割裂：** 真实的服务器运维中，没人用 tmux 跑生产环境。一旦服务器重启（比如云服务商维护），网站就挂了。应该教 `Systemd` 服务配置。
- **安全配置（Root/Debug 裸奔）：**
	- **理论：** “网络安全冬令营”。
	- **手册实践：** 全程 Root 权限，Flask 开 Debug 模式。
	- **割裂：** 这是在教学生留后门。任何安全竞赛的第一课都应该是“最小权限原则”，这里完全背道而驰。

#### 割裂点 3：操作流的断层（DNS 与 HTTPS）

- **现象：**
	1. 先在 NameSilo 配置 DNS 解析（2.2 章节）。
	2. 然后在 Certbot 申请证书时（3.4.2 章节），又要去配置一遍 DNS TXT 记录。
- **痛苦点：** 学生会觉得“我不是配过 DNS 了吗？为什么还要配？”
- **原因：** 手册选择了最麻烦的 `DNS-01` 验证方式，而不是利用现成 Nginx 的 `HTTP-01` 验证。这导致操作逻辑在“配置域名”和“申请证书”之间反复横跳，且极度依赖 DNS 生效时间。

---

### 三、 总结：这本手册在教什么？

如果剥去冗余，这本手册试图构建的 **最终架构** 是这样的（但讲得不清楚）：

代码段

```markdown
graph TD
    User[用户浏览器] -->|HTTPS:443| Nginx[Nginx 反向代理]
    
    subgraph 云服务器
        Nginx -->|路径 /| Flask[Flask App (Python)]
        Nginx -->|路径 /myblog| StaticFiles[Hugo 生成的静态 HTML]
        
        Flask -->|运行在| Port8080[端口: 8080]
        StaticFiles -->|存储在| Dir[/var/www/html/myblog]
    end
    
    subgraph 开发流程
        Dev[本地 Windows] -->|Git Push| Repo[代码仓库]
        Repo -->|Git Pull| Server[云服务器]
        LocalHugo[本地 Hugo 生成] -->|SCP/上传| Dir
    end
```

**你的感觉是对的：**

1. **Windows 环境配置** 确实是“为了教流程而牺牲体验”的冗余。
2. **Flask 到 Hugo** 确实很生硬，它们只是刚好住在同一台服务器上的两个陌生邻居，靠 Nginx 这个房东（配置文件）强行凑在一起。
3. **潜在风险** （Root 权限、Debug 模式、Tmux 部署）是这本手册最大的隐患，在实际工程中是不可接受的。

如果你去设计（从一个网络专家、一个资深的网页开发者）来说，你会让整个流程怎么更加顺畅合理？

如果我是课程设计者（站在 **资深 Web 开发者** 和 **网络安全专家** 的角度），我会彻底重构这份手册。

我的核心原则是： **“去伪存真，贴近实战”** 。 我们要砍掉所有为了“凑步骤”而存在的冗余操作，保留那些真正能让学生理解互联网运作原理的核心技术，并引入工业界的标准流程。

以下是我设计的\*\*《现代 Web 全栈与安全实战手册》\*\*重构方案：

### 核心架构图：这一套方案到底在做什么？

---

### 第一阶段：开发环境去割裂化 (Remote-First)

**目标：** 抛弃“本地一套，线上又一套”的痛苦，实现环境统一。

- **旧方案痛点：** Windows 装 Python/Hugo，Linux 再装一遍。环境不一致导致报错。
- **新方案：VS Code Remote-SSH 一把梭**
	1. **动作：** 拿到服务器 IP 后，第一件事就是用 VS Code 安装 `Remote - SSH` 插件连接服务器。
	2. **优势：**
		- 学生的所有代码编写、终端命令执行， **全都在服务器上进行** 。
		- **0 本地配置：** 学生甚至可以用 iPad 或 Chromebook，只要能装 VS Code。
		- **所见即所得：** 你在编辑器里写完代码，Ctrl+S 保存，服务器上就已经生效了，无需 Git Push/Pull 或 SCP 上传（调试阶段）。

### 第二阶段：Flask 部署——从“玩具”到“服务” (Production Ready)

**目标：** 学会真正的后端部署，而不是跑一个随时会挂的 Debug 脚本。

- **旧方案痛点：** `python app.py` (Debug模式)，用 Tmux 挂后台。
- **新方案：Gunicorn + Systemd**
	1. **代码修正：** 去掉 `app.run()` 。Flask 只负责逻辑，不负责 HTTP 服务器。
	2. **引入 WSGI：** 安装 `gunicorn` (Python 生产级服务器)。
		- 命令： `gunicorn -w 4 -b 127.0.0.1:8080 app:app` (这才是工业界跑 Python web 的方式)。
	3. **进程守护 (Systemd)：**
		- 教学生写一个简单的 `.service` 文件（只需 5 行）。
		- 命令： `systemctl enable myapp` -> `systemctl start myapp` 。
	4. **教育意义：** 这样服务器重启后网站会自动运行。这教会了学生什么是\*\*“守护进程 (Daemon)”\*\*，这是运维的基础。

### 第三阶段：Hugo 博客——动静分离 (Static Generation)

**目标：** 理解“编译”概念，体验高性能内容分发。

- **旧方案痛点：** 本地生成 `public` 文件夹，再手动传到服务器。
- **新方案：服务器端构建**
	1. **动作：** 在服务器上直接安装 Hugo（通过 SSH 终端）。
	2. **流程：** 在 VS Code 里写 Markdown 文章 -> 在终端运行 `hugo` 命令。
	3. **结果：** `public` 文件夹直接生成在 Nginx 的目录下。
	4. **教育意义：** 这里的 Hugo 充当了“构建工具”的角色。无需文件传输，效率极高。

### 第四阶段：网关与安全——自动化与标准化 (Gateway & Security)

**目标：** 掌握流量入口的管理，遵循安全基线。

- **旧方案痛点：** 手动改 DNS TXT 记录申请证书；Root 裸奔；端口全开。
- **新方案：Nginx 自动化 + 安全基线**
	1. **安全基线 (Security Baseline)：**
		- **创建用户：** 禁止直接用 Root，新建一个 `ctf_user` ，演示 `sudo` 的重要性。
		- **防火墙 (UFW)：** 只开放 80, 443, 22。演示如果把 22 关了会发生什么（惨痛的教训是最好的老师）。
	2. **Nginx 配置：**
		- 保持原来的反向代理逻辑（这是精华），但解释得更清楚：Nginx 是\*\*“前台” **，Flask 是** “后厨” **，Hugo 是** “自助餐台”\*\*。
	3. **HTTPS 自动化：**
		- 使用 `certbot --nginx` 。
		- 它会自动读取你的 Nginx 配置，自动验证域名，自动修改配置文件开启 HTTPS，自动设置定时续期。
		- **教育意义：** 现代运维讲究“自动化”，而不是重复造轮子。

---

### 重构后的课程流程对比

| 模块 | 旧版（冗余且业余） | 新版（顺畅且专业） | 核心收益 |
| --- | --- | --- | --- |
| **0\. 准备** | 网页终端拿密码，装 Windows 环境 | 网页终端拿密码， **装 VS Code SSH** | 统一环境，屏蔽系统差异 |
| **1\. Flask** | 跑 Debug 模式，用 Tmux 挂机 | 用 **Gunicorn** 跑，用 **Systemd** 守护 | 学会真正的 Linux 服务管理 |
| **2\. Hugo** | Windows 生成 -> SCP 上传 | **服务器端生成** ，Nginx 直接指目录 | 开发部署一体化，效率提升 10 倍 |
| **3\. Nginx** | 手写配置，手动 DNS 验证证书 | 手写配置， **Certbot 插件自动签发** | 体验标准化的自动化运维 |
| **4\. 安全** | Root 权限，端口全开 | **普通用户 + Sudo + UFW 防火墙** | 建立基本的网络安全意识 |

### 为什么这样设计更合理？

1. **逻辑连贯：** 从头到尾学生都在操作 **同一台服务器** 。所有的工具（Flask, Hugo, Nginx）都是服务器上的积木，拼装感很强，不再割裂。
2. **符合实战：** 如果学生去字节跳动或腾讯实习，他们看到的就是 Systemd、Gunicorn 和 Nginx，而不是 Tmux 和 `python app.py` 。
3. **排错容易：** 因为环境统一在 Linux 服务器上，老师不需要解决“老师我的 Windows 环境变量配错了”这种毫无营养的问题。

这才是对学生时间负责的教学方案，既保留了底层原理的探索（Nginx 配置、Linux 命令），又剔除了过时的糟粕（手动 DNS 验证、Tmux 跑服务）。

既保留了底层原理的探索（Nginx 配置、Linux 命令）。

主要是原本的方案，我感觉逻辑我都没梳理清楚。你重新梳理一下呢？我更好的了解。

没问题。这份手册之所以让你觉得“乱”，是因为它把 **开发（写代码）** 、 **运维（配服务器）** 、\*\*网络（配域名）\*\*这三条线像面条一样搅在一起了。

如果要把这 100 多页的 **原始逻辑** 理顺，我们不能按它的目录走，而要按\*\*“流量（数据）是如何流动的”\*\*这个逻辑来重组。

你可以把整个手册构建的系统想象成一家\*\*“前店后厂”的餐厅\*\*。

以下是剥离了繁琐步骤后的 **核心逻辑架构图** ：

### 核心逻辑架构：从“用户”到“代码”

我们把手册里的所有操作，归纳为搭建这四个层级：

代码段

```markdown
graph TD
    %% 外部世界
    User((用户/浏览器)) -->|1. 输入域名 www.0xse.cc| DNS[DNS系统]
    DNS -->|2. 解析出 IP| ServerIP[阿里云公网 IP]
    
    %% 服务器内部 (Ubuntu)
    subgraph 云服务器 [Linux Server]
        direction TB
        
        %% 入口层：前台接待
        ServerIP -->|3. 端口 443 (HTTPS)| Nginx[Nginx (大管家/反向代理)]
        
        %% 路由分发层：Nginx 的核心逻辑
        Nginx -->|4a. 访问根路径 /| ProxyPass[转发给 Flask]
        Nginx -->|4b. 访问博客 /myblog| StaticAlias[读取静态文件目录]
        
        %% 业务层：后厨与仓库
        ProxyPass -->|5a. 内部端口 8080| FlaskApp[Flask 程序 (Python动态应用)]
        StaticAlias -->|5b. 文件路径 /usr/.../myblog| HugoFiles[Hugo 生成的 HTML (静态网页)]
    end
```

---

### 第一层：门面与地址 (DNS & HTTPS)

**对应手册章节：** 2 (域名配置) & 3.4 (HTTPS)

- **逻辑：** 你的服务器就像一家开在荒郊野岭（IP地址）的餐厅。
	- **域名 (NameSilo)：** 你花钱买了块招牌（ `0xse.cc` ），并在黄页（DNS）上登记，告诉大家这块招牌对应那个荒郊野岭的地址。
	- **HTTPS (Certbot)：** 只有招牌还不够，你还得去公安局（Let's Encrypt）申请个营业执照（SSL证书），证明你是正规店，不是黑店，顾客才敢进来。
- **手册做的繁琐步骤：** 让你手动去改黄页记录（DNS TXT验证）来领执照，而不是让公安局直接上门核实（HTTP验证）。

### 第二层：前台大管家 (Nginx)

**对应手册章节：** 3.4 (Nginx配置) —— **这是全书的核心逻辑枢纽**

- **逻辑：** 顾客进门了，但你这家店很奇怪，卖两样完全不同的东西： **现做的热菜（Flask）** 和 **预制好的盒饭（Hugo）** 。你需要一个大管家（Nginx）站门口分流。
- **配置文件的翻译：**
	- `location /` `proxy_pass http://127.0.0.1:8080`
		- **人话：** “凡是没说具体要去哪的，都领到 8080 号桌，那边有厨师（Flask）现做。”
	- `location /myblog` `alias /usr/share/nginx/html/myblog`
		- **人话：** “凡是说要看博客的，直接带到仓库，把架子上的书（HTML文件）给他看。”

### 第三层：后厨 (Flask 动态应用)

**对应手册章节：** 1.1, 1.3, 3.2, 3.3

- **逻辑：** 这是你的 **热菜厨房** 。
	- **特性：** 它是“活”的程序。它需要 Python 环境才能跑，需要有人一直盯着火（运行中）。
	- **端口：** 它躲在后厨，监听 `8080` 端口。外面的客人（公网）看不见它，只有大管家（Nginx）能联系它。
- **手册做的繁琐步骤：**
	1. **本地开发：** 让你先在 Windows 上模拟一遍做菜流程（装 Python、VS Code）。
	2. **远程部署：** 然后去服务器上，用 Tmux（一个不会自动熄灭的炉子）把这个程序跑起来。如果不挂 Tmux，你一断开连接（离开厨房），火就灭了。

### 第四层：仓库 (Hugo 静态博客)

**对应手册章节：** 3.5 (博客搭建)

- **逻辑：** 这是你的 **展示柜** 。
	- **特性：** 它是“死”的文件。不需要 Python，不需要运行，就是一堆写好的纸（HTML）。
	- **生成过程：** 你在家里（Windows）把文章写好，用印刷机（Hugo）印成书（生成 `public` 文件夹）。
- **手册做的繁琐步骤：**
	- 它让你在本地印好书，然后还要像搬家一样，把这一箱子书（ `public` 文件夹）通过网络搬运（SCP/Git）到服务器的指定架子上。

---

### 为什么你会觉得“割裂”？

把这四个层级拼起来，你就能看懂手册原本的\*\*“匪夷所思”\*\*之处了：

1. **为了这一碟醋（Nginx 练习），包了这顿饺子：** 手册的核心目的是让你练习 **Nginx 如何同时处理“转发端口（Flask）”和“读取文件（Hugo）”** 。为了实现这个教学目的，它强行让你搭建了两个毫不相关的应用。
2. **时空错乱：**
	- 一会儿在 **本地 Windows** （装环境、写代码、生成博客）。
	- 一会儿在 **NameSilo 网站** （配 DNS）。
	- 一会儿在 **阿里云黑框框** （配 Nginx、挂 Tmux）。
	- **手册没有把这三个“地点”的关系讲清楚：**
		- Windows 是\*\*“生产车间”\*\*。
		- NameSilo 是\*\*“指路牌”\*\*。
		- 阿里云是\*\*“营业大厅”\*\*。

### 总结：手册原本想教你的“正道”

抛开那些糟糕的配置细节，这本手册试图教会你的一条 **黄金法则** 是：

**“互联网服务 = 唯一的入口 (Nginx/443) + 不同的后台服务 (Flask/8080, Static Files)”**

所有的繁琐步骤，最终都是为了让下面这个瞬间发生： 当你在浏览器输入 `https://www.0xse.cc/` 时，Nginx 接到请求，转身从 8080 端口把 Flask 算好的结果拿回来，再加密传回你的浏览器。

现在这个逻辑理顺了吗？

get了。

其实flask干啥了，取决于各个学生用flask写了什么样的动态网页是吧？

blog反正就是hugo的静态网页哈？

  

graph TD

%% 外部世界

User((用户/浏览器)) -->|1. 输入域名 www.0xse.cc| DNS\["DNS系统"\]

DNS -->|2. 解析出 IP| ServerIP\["阿里云公网 IP"\]

%% 服务器内部 (Ubuntu)

subgraph 云服务器 \["Linux Server"\]

direction TB

%% 入口层：前台接待

ServerIP -->|3. 端口 443 HTTPS| Nginx\["Nginx 大管家反向代理"\]

%% 路由分发层：Nginx 的核心逻辑

Nginx -->|4a. 访问根路径 /| ProxyPass\["转发给 Flask"\]

Nginx -->|4b. 访问博客 /myblog| StaticAlias\["读取静态文件目录"\]

%% 业务层：后厨与仓库

ProxyPass -->|5a. 内部端口 8080| FlaskApp\["Flask 程序 Python 动态应用"\]

StaticAlias -->|5b. 文件路径 /usr/.../myblog| HugoFiles\["Hugo 生成的 HTML 静态网页"\]

end

  

是flask还是blog，这个具体怎么区分呢？

  

我对于本次的产出感到疑惑。

  

这目前不是手册的全部，所以我不确认这个租服务器到底有啥必要。

  

其实如果只是静态网页的话，用这个：静态博客 (Hugo)： 使用 GitHub Pages 或 Netlify。

  

操作： 将 Hugo 项目推送到 GitHub，开启 Pages 功能，自动构建并发布，无需本地生成 public 文件夹再上传。

就足够了哈？

  

就算是flask+静态网页都有的话，动态网站 (Flask)： 使用 Vercel、Render 或 Railway。

  

操作： 将代码上传到 GitHub，连接 Vercel，点击“Deploy”。它会自动安装依赖、分配 HTTPS 域名、自动扩容。

  

这些也够了吧？

你的理解完全正确，甚至已经有点“降维打击”这份手册的意思了。

我们分两个层面来回答你的疑惑：一是 **技术实现** （怎么区分 Flask 和 Blog），二是 **教学目的** （为什么要用这么“原始”的方案）。

### 1\. 它是怎么区分 Flask 还是 Blog 的？

你的直觉没错，全靠 **Nginx（大管家）** 根据 **URL（网址路径）** 来区分。

在手册的 **3.4.3 章节** ，有这样一段 Nginx 配置（我把它翻译成人话）：

- **场景 1：** 用户访问 `www.0xse.cc/myblog/post/1.html`
	- Nginx 看到 `/myblog/` ，命中 **规则 A** 。
	- 它直接去磁盘目录 `/usr/share/nginx/html/myblog/post/1.html` 把文件拿出来给用户。
	- **Flask 全程不知道发生了这件事** 。
- **场景 2：** 用户访问 `www.0xse.cc/user/login`
	- Nginx 发现不匹配 `/myblog/` ，于是命中 **规则 B** 。
	- 它把请求扔给 `127.0.0.1:8080` 。
	- Flask 收到请求，运行 Python 代码，查询数据库，返回“登录成功”。

**结论：** 区分的关键就是 **URL 路径** 。Nginx 是分流器， `/myblog` 往左走（读文件），其他往右走（找程序）。

---

### 2\. 既然有 Vercel/Netlify，租这个服务器到底有啥必要？

**如果不考虑“教学”和“安全竞赛”背景，纯粹为了搭建这两个网站，你的 Serverless 方案（Vercel + GitHub Pages）绝对是标准答案，手册里的方案是“原始且低效”的。**

但是，结合手册里的关键词 **“DataCon（数据安全竞赛）”** 、 **“清华附中”** 、 **“冬令营”** ，这个租服务器的“必要性”就体现出来了。

**Serverless 方案虽然方便，但它屏蔽了三个对“安全/计算机学生”至关重要的东西：**

#### A. 屏蔽了“操作系统” —— 你怎么学系统安全？

- **Vercel 方案：** 你根本接触不到 Linux 系统。你无法练习 `chmod` 权限管理，无法学习 `ssh` 密钥登录，无法配置 `iptables` 防火墙。
- **VPS 方案：** 给你一个裸的 Linux。如果不小心把 22 端口关了，你就连不上了；如果用 Root 弱密码，你就会被爆破。 **这种“把系统搞挂”的经历，是计算机新手的必修课。**

#### B. 屏蔽了“中间件配置” —— 你怎么学网络防御？

- **Vercel 方案：** Vercel 帮你配好了 Nginx/网关，你看不见配置。
- **VPS 方案：** 你必须亲手写 Nginx 配置。
	- *进阶思考：* 如果有人对你的 Flask 发起 CC 攻击（拼命请求），你在 Vercel 上只能付钱；但在 VPS 上，你可以去改 Nginx 配置做限流（Rate Limiting），或者分析 Nginx 日志封 IP。 **这是安全竞赛的考点。**

#### C. 屏蔽了“全链路视野” —— 你只看到了结果

- **Vercel 方案：** 像点外卖。你下单（Push代码），饭就送到了（网站上线）。
- **VPS 方案：** 像自己做饭。你要买菜（买服务器）、切菜（配环境）、炒菜（跑 Flask）、摆盘（Nginx）。
	- 虽然麻烦，但如果有一天饭是馊的（网站报错 502），“做饭的人”知道去检查锅（后端进程），而“点外卖的人”只能干瞪眼。

### 总结：本次产出的意义

你对于“产出”感到疑惑，是因为你把\*\*“上线的网站”\*\*当成了唯一的产出。

- **如果目标是“网站”：** 手册方案确实是垃圾，费钱费时费力。你的 Serverless 方案完胜。
- **如果目标是“能力”：** 本次的产出不是那个丑丑的 Flask 网页，而是：
	1. 学生学会了 **Linux 命令行** 操作。
	2. 学生理解了 **Web 服务器（Nginx）是如何转发流量的** 。
	3. 学生体验了 **HTTPS 证书是如何签发的** 。
	4. 学生拥有了一个可以用来练习 **攻防渗透的靶场** （自己的服务器）。

**一句话总结：** **Vercel 是为了“让网站跑起来”，而这本手册是为了“让你知道网站是怎么跑起来的”。**

对于清华附中冬令营的学生（未来可能的计算机精英），让他们在舒适区（Serverless）之外，去泥地里（VPS + Linux）滚一圈，是很有必要的“成年礼”。

感觉他想做的是这样的？

没错，这张流程图 **完全精准地概括了整本手册的架构逻辑** 。它就像是这 100 多页文档的“作战地图”。

我们可以对照这张图，再次确认一下手册设计者的意图，以及我们之前讨论的“冗余点”在哪里：

### 1\. 核心架构完全吻合

这张图清晰地把系统分成了三个部分，完美对应了手册的章节安排：

- **左侧：访问入口 (Access)**
	- **图示：** 用户 域名 安全证书。
	- **手册对应：** 第 2 章（域名配置）和 第 3.4 章（HTTPS 配置）。
	- **目的：** 建立合法的互联网入口。
- **右侧：云端生产环境 (Production)**
	- **图示：** 远程 Ubuntu 服务器 Nginx 反向代理/负载均衡。
	- **手册对应：** 第 1.5/1.6 章（获取服务器）和 第 3.4 章（Nginx 配置）。
	- **细节：** 图中明确提到了“从 DataCon 竞赛平台获取”，这和你提供的另一张截图（赛题环境弹窗） 是完全对应的。说明这确实是一个竞赛导向的标准环境。
- **下方：本地开发环境 (Development)**
	- **图示：** 本地 Windows 系统搭建网站 上传 (VS Code Remote SSH/Git)。
	- **手册对应：** 第 1.1 - 1.3 章（本地环境搭建）和 第 3.5 章（本地生成 Hugo）。
	- **关键点：** 这里特别标注了“本地 Windows 系统”和“远程 Ubuntu”是两个独立的方块，中间通过“上传”连接。

### 2\. 这张图也暴露了“割裂感”的来源

请注意图中下方那个巨大的 **“本地 Windows 系统搭建网站”** 模块。

- **它的位置：** 它是独立于“远程 Ubuntu 服务器”之外的。
- **它的含义：** 这张图视觉化了手册的逻辑—— **“先在本地造好轮子，再把轮子搬到云上去”** 。
- **我们的优化思路：** 现代化的开发流程（如 VS Code Remote 开发）其实是把“本地 Windows”这个方块直接 **抹掉** ，或者让它和“远程 Ubuntu”重叠。所有的开发动作直接发生在右上角的紫色方块（Ubuntu 服务器）里。

### 3\. 总结

这张图就是手册设计者的\*\*“理想蓝图”\*\*：

1. **分层清晰：** 有前端（域名）、有网关（Nginx）、有后端（Flask/Hugo）。
2. **流程标准：** 符合传统的“开发 部署 上线”瀑布流。
3. **教学意图明显：** 图中把 Nginx 单独列出来叫“反向代理/负载均衡”，再次印证了让学生手写配置就是为了理解这个知识点。

所以，这确实就是他想做的事。虽然在工程上不够敏捷（特别是左下角的本地开发部分），但作为一个 **教学架构图** ，它是逻辑自洽的。

  

Gemini 的回答未必正确无误，请注意核查

Google 账号

yiwen shang

gddkfffg22@gmail.com