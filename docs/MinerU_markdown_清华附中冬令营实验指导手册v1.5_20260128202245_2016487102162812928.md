# 2026“极智挑战”智能安全科技冬令营实验指导手册

清华附中 奇安信集团

# 目录

# 1 基础环境建设与网络搭建 3

# 1.1 基础环境搭建 4

1.1.1 Python 和 Pip 4

1.1.2 Visual Studio Code 7

1.1.3 Flask框架 21

1.1.4 HTML 实践作业 44

1.1.5Git工具 44

1.1.6 从 DataCon 竞赛平台获取实验所需云服务器 ..... 55

1.1.7阿里云服务器购买（扩展内容，按需） 62

# 1.2 域名配置 64

1.2.1 域名注册 65

1.2.2 域名解析配置 70

1.2.3 DNS 缓存清理 74

# 1.3 网站搭建 79

1.3.1 服务器上部署项目代码 ..... 79

1.3.2 服务器安装 Flask ..... 82

1.3.3 启动网站 ..... 83

1.3.4 Nginx 配置 ..... 86

1.3.5 HTTPS 配置 ..... 88

1.3.6 博客网站搭建（扩展内容） 99

1.3.7搭建自己博客 124

# 【实验前置基础条件】

本实验涉及第三方平台账号注册、域名购买，为确保实验顺利进行，请所有学员确保上课时：

1. 拥有一个上课时可登陆的个人电子邮箱用来接受邮箱验证码（推荐使用 126、163 邮箱），需要在上课前提前注册并在浏览器中登陆（必须）；

2. 确保能够通过支付宝进行支付，预计支付金额为 3-5 美元（约合人民币 20-30 元）用来购买个人域名，请学生自备具备支付能力的手机、平板、电子手表等电子设备（按照学校要求统一管理）；如不具备上述条件，可在课上联系班主任协助支付。

3. 实验基于 Windows 操作系统设计，如使用 MacOS、Linux 等其他操作系统，实验步骤可能与手册略有区别，需要自行解决可能面临的环境、步骤不一致问题。

4. 使用手机号提前注册硅基流动账号（https://account.siliconflow.cn/zh/login），并且绑定个人邮箱，方便上课时通过邮箱登陆。

5. 上课时能够随时访问网页版 AI 应用 (DeepSeek、元宝、豆包等均可),本活动鼓励学生借助 AI 工具完成实验、解决问题。

# 1 基础环境建设与网络搭建

# 【环境介绍与实验目标】

“欢迎来到“云端网站搭建”冒险之旅！在这个模块中，你将体验一次从“本地实验室”到“全球舞台”的奇妙转变——亲手搭建一个属于自己的网站，并把它安全地送上互联网！就像建造一座数字小屋：先在自己电脑上设计搭建（Flask开发），然后为它在云服务器上安个“家”（阿里云部署），最后挂上专属门牌（域名）并加上安全锁（HTTPS证书）。学完这个模块，你不仅能掌握网站开发的核心技能，还能理解真实网站如何运行在互联网上，让全世界的小伙伴都能安全访问你的创意成果！

# 1.1 基础环境搭建

本次实验将在本地 Windows 系统与远程阿里云 Ubuntu 服务器环境下，完成一个基于 Flask 框架的本次课程实验网站和一个基于 Markdown 转 HTML 博客网站从开发到安全部署的完整流程。首先，完成 Python、Pip 等基础运行环境的配置，学习、开发 Flask 应用和部署；之后，购买域名并将其解析指向阿里云服务器的公网 IP，实现通过域名访问服务器的效果；接着，在服务器上部署本次课程实验网站源码，并为该网站申请 TLS 证书。通过 Nginx 设置反向代理，将外部 HTTP/HTTPS 的请求转发至服务器的本次课程实验网站；最后，学习 Markdown 转 HTML 快速生成网站，并实现通过 Nginx 额外部署个人博客网站。

# 1.1.1 Python和Pip

Python 是一种高级、解释型且通用的编程语言，以其简洁明了、类似英语的语法和出色的代码可读性而著称，非常适合编程初学者入门。同时，它功能极为强大，应用领域覆盖网页开发、数据分析、人工智能及自动化脚本等众多方面，并拥有一个由全球开发者共同构建的庞大生态系统，提供了数百万个第三方库和工具包，使得开发者能够轻松复用代码，快速实现复杂功能，而无需从零开始。

Pip 是 Python 的包管理工具，堪称 Python 的“软件管家”，其核心工作是从在线仓库（主要是 PyPI）中查找、安装、升级和卸载第三方库或包。借助 pip，用户只需使用简单的命令（如 pip install 包名进行安装、pip list 列出已安装包、pip uninstall 包名卸载包）即可高效管理依赖和扩展功能。

通常，在安装Python（版本3.4或2.7.9以上）时，pip会自动一同安装，无需额外安装。为开发者使用丰富的Python生态系统提供了极大便利,本书以python 3.14.2和pip25.3为例，介绍后续实验的操作。

# 安装Python与Pip

Python官网：https://www.python.org/

Python 下载地址：https://www.python.org/downloads/

本文以目前最新版本 python 3.14.2 为例进行后面实验，访问：

下滑页面中找到 Windows installer (64-bit) 点击下载。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/f724d97cd1a569dcb7d0340620570d69be8fd60e56a4846a7e269c5158720483.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/11bc5a33beb97f7816a71f9effe10296c64fee532e051abd0694f202bace9988.jpg)


下载完成后，在本机双击python-3.14.2-amd64.exe进行安装，注意一定要选中Add python.exe to PATH，将Python解释器添加至系统全局变量中，否则需要自行手动配置，后续步骤默认点击即可。如忘记勾选，可再次执行安装程序，删除Python后重新安装。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/044d91d71199390858386b7140755d86ee80c7c2731785c0151110b43b1f9410.jpg)


为方便实验演示，这里我们将Python安装在C:\python路径下，完成后可在C:\python目录中看到对应的文件内容。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/80209ba78064ee43f0f94bfc530fbf88675f451c93d715826179a7894b91b272.jpg)


# 验证安装是否成功

按 Win+R 组合键，打开电脑 CMD（Command Prompt，中文：命令提示符，Windows 操作系统中的一个命令行解释器）。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/68fa210d8885ce15b73b3af0facab4398e0f4eb6e99705ffc722ae52a6cdadd7.jpg)


分别执行以下命令，若出现版本号即说明安装成功。

python --version

pip --version

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/661e62ab3dd8c663a335692ad3ec79f904e2e2422a4d88cfc043288c528d3807.jpg)


# 1.1.2 Visual Studio Code

Visual Studio Code（VS Code）是一款由微软开发的免费、开源、跨平台代码编辑器，它以轻量级和高性能为核心，通过强大的扩展生态几乎支持所有编程语言和开发场景。VS Code不仅提供智能代码补全（IntelliSense）、集成调试器、内置Git控制和终端，还可借助海量扩展实现远程开发、容器管理、数据科学等高级功能，在简约编辑器与全功能IDE之间取得了完美平衡。其持续迭代的更新机制、高度可定制的界面以及活跃的社区支持，使其成为全球开发者首选的现代化开发工具，适用于从Web前端到云端微服务的各类项目。

# 安装VSCode

浏览器访问 VS Code 官网地址：https://code).(visualstudio.com/，点击下载按钮。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/ff8d172a24886ce1495fed25ffbe8149b3c26e3c824f1d65cfb785725a9eb600.jpg)


当前最新版本为 VS Code 1.107.1，下载完成后双击运行 VSCodeUserSetup-x64-1.107.1.exe，为方便实验演示，本次安装路径为：D:\VSCode\Microsoft VS Code。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/a9615e734e37c896138f0734562f80bca470d76f96533f02b93e49568ee35478.jpg)


安装过程中，可为VS Code添加桌面快捷键，这样方便后期启动VS Code。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/c7a3fe88e60e404ff0cccfdfb5c4d7c96c36ad993d0bf0030a863224232f4899.jpg)


安装 - Microsoft Visual Studio Code (User)

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/4baaa4039064d664a58e7ac066be6fa17db93e0bafb35839087d38b8a4348f67.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/fa306f8d6ddb3aa6c57bc6810611dd778614c9ae549d5c04bd46d4098332c4a6.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/f42c9d4784406ca68680f2050abe0f82f2336f90b2706c9abd72babd6c0ea58f.jpg)


# 选择附加任务

您想要安装程序执行哪些附加任务？

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/9e783a94bfc3d89127ddc2e03ebccd0cbaf71ce42a5706c94163f428180560da.jpg)


选择您想要安装程序在安装Visual Studio Code时执行的附加任务，然后单击下一步。

附加快捷方式：

创建桌面快捷方式

其他：

将通过Code打开操作添加到Windows资源管理器文件上下文菜单

将通过Cout打开操作添加到Windows资源管理器目录上下文菜单

将Code注册为受支持的文件类型的编辑器

添加到PATH（重启后生效）

上一步（B）

下一步(N)

取消

安装完成后，在桌面双击VSCode图标，启动VSCode。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/23d9b09d43c6f30b00febd057da3c8f96322528a64d3929e9e5d97c466fbb48f.jpg)


# 安装第三方扩展

按照图例顺序，选中左方按钮，进入插件功能（EXTENSION）。

插件一：简体中文

搜索 Chinese，选择 Chinese (Simplified) Language Pack for Visual Studio Code，其核心功能只有一个，就是将 VS Code 的用户界面本地化为简体中文。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/f0d52bff39cfc6324596c112474b933de7e4087c05ee2397770701a6e774258a.jpg)


通过使用“Configure Display Language”命令显式设置VS Code显示语言，可以替代默认UI语言。按下“Ctrl+Shift+P”组合键以显示“命令面板”，然后键入“display”以筛选并显示“Configure Display Language”命令。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/7e24b0004f907b90a2832c0612eb519eea5fa78c4c75780e324c61ce9e809979.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/37eafe95132c2538dfd62d8643d61c2eeecf22def072b59e1edb4499ece63bf1.jpg)


此时会出现提示重启生效，点击 Restart 按钮，重启 VS Code。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/1b9db580aa855f22a5c43255b9ff4e36e045a9b2c3dd2054e176228928fc868e.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/8e0ce3ea2d0a34fb28cee1849a11168bce2b83bd285646c89567369ba22ad23d.jpg)


# Restart Visual Studio Code to switch to 中文(简体)?

To change the display language to中文(简体), Visual Studio Code needs to restart.

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/926d818b78e2beca82081751dbfbd083c1fb3326dc64eaf4f4af9556df84fbb1.jpg)


重启后，就能看到 VS Code 中呈现为简体中文样式。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/8d38d4d4e75f4763f797433f72067712c5fd5ac5f97386de7009af942a0ee6f6.jpg)


# 插件二：Python

Python插件是一个官方开发的强大扩展，它将轻量级的代码编辑器转变为功能完备的Python集成开发环境（IDE）。该插件提供了代码智能补全、语法高

亮、定义跳转等核心编辑功能，并集成了可视化调试器、多种代码格式化与检查工具。它让开发者能直接在编辑器中管理 Python 解释器和虚拟环境、运行单元测试，甚至无缝编写和运行 Jupyter Notebook，从而显著提升从 Web 开发、数据分析到机器学习等各类 Python 项目的开发效率与体验。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/7cd3da20b7c41742032900deaac54fa87423c627393ea550b77e8a3079de47cd.jpg)


使用快捷键 Ctrl+Shift+P 输入 Python: Select Interpreter，择已安装的 Python 解释器。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/7b36352f015502f09af2d2a494960e5865e49df1fb5f6652f0117891c17e124c.jpg)


下面演示创建一个新Python文件的操作过程。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/1d11094c388c729733bf3d53c23e721ec9ed5d0dde5670cd114ef3a1b3f31b71.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/89338b6c348399a880f2b2f4cc2e0976cf20beec81595de4a75c6d177fb48b67.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/54431f16f4bcad3e21a4cac8027d17b724f0294996c0fa7d9f6c3ca2b3909793.jpg)


编辑Python文件内容。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/8c1cc63596e165086482282561641e533044ac20826e771de050012dd0d816ee.jpg)


按 Ctrl + S 保存文件，指定保存的路径，这里以保存的桌面为例。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/243f693def08cf3f7748540a09db2316722b353093c4018fbaf7ab63bfa07c0b.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/9aa6806719269cff4536a9c0b5dfb423dfcaa6e8c4fd3e1dcc06e0f36db63764.jpg)


# 插件三：Remote-SSH

Remote-SSH插件允许开发者通过安全的SSH协议，直接连接到远程服务器、虚拟机或容器，并在本地VS Code界面中获得与本地开发几乎无异的完整开发体验。开发者可以像操作本地文件一样，在远程机器上无缝地浏览、编辑、运行和调试代码，同时还能安装和使用各种VS Code扩展。这消除了环境配置差异带来的困扰，特别适用于需要在远程高性能服务器、专属测试环境或统一生产环境中进行开发的场景，极大地简化了远程开发工作流。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/8b7bb131a9462d089399beb61f0b94439c54645a08abc61f95fc2cdb63eb4f00.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/dc4cf05050b601b936dd746c88b98b27696bd89f2e44001b9aa6a6259ddfd005.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/748ae81f08617106b304929f92f2d500fe0e5ea8ebbbbaf70b2c39240ab6457a.jpg)


下图为两个 ssh 连接配置的样例，第一个为使用常规密码登录服务器，第二个是使用公钥免密登录服务器。编辑、保存右侧配置文件后，左侧就会出现对应的服务列表名称。本实验中需要学生替换为自己的服务器 IP 地址和用户名。如需使用公钥免密登录请自行了解，本实验不做要求。如何获取服务器地址请参考 1.1.6 章节 从 DataCon 竞赛平台获取实验所需云服务器。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/a364f20f0d08faf5125036c7d42474c2a53130f3dc8cc463ca1ef67ae2f94f63.jpg)


完成配置后，点击连接按钮。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/34a4faba337fb91e489e4aa685ed811a2fdd9eea9ebf5133aced171bb1d32660.jpg)


初次登录时需要指定服务器的系统类型,本课程统一使用Linux系统。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/97ddc8752c4682b7ebc36e6353c2d467e9a0492d6908117ef0f840dc7fcff266.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/dfefae6cf44ed32ffa037fd7e9b0e742512a7ce4c538f4286f600669776acfb1.jpg)


每次登录时都需要输入密码，已配置公钥免密登录的无需输入密码。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/e5fbac79142a529320212dd607ab35d5379359a8a542ba02eaeb8a353d86c0ee.jpg)


连接成功示意图：

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/1f8f8c0e014a40608b7971f3b7ae034fc9ba67fbcb76250e8c1502284bb0bc68.jpg)


连接成功后可创建新文件，直接远程对文件进行内容编辑。如需运行Python文件，可参考1.1.2中VS Code终端，在VS Code中通过远程终端执行Python命令。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/bf2cb3efeec8b1d1bf2739aeeecb35848159333eaeb15e0188b03773b9cef17c.jpg)


也可选择打开远程文件夹，默认会出现根路径（/）下的所有文件夹，这里以打开 /root/ 为例。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/2d53689b538d85f6295fda430b19cd2547c0af0fb66545edb521af6c11a6afde.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/229993be3954c9995e6e1099424b283b3a4460e1b4c7ccc3ddc2dfbef731ec2c.jpg)


连接成功后，在左侧就能看到 /root/ 文件夹中的所有文件目录。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/0fe9681b314a9a4c6303ed73c49f6004f95a808ee9a3b7b01ba7d85f299ba7f7.jpg)


可通过拖拽本地主机文件到该目录，实现上传本地文件到服务器指定路径的效果。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/e0b8e7c397a7cbb2a4e95809bb7717d9d4e3ad875a503404c5b3999c23455f83.jpg)


上面演示的是将本地文件上传到服务器，这里演示如何将服务器文件下载到本地。右键服务器目录栏中要下载的文件，点击下载按钮可从服务器下载文件到本地。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/7b372df5d2459258a8d77bbec2fc8102bac16c0a2a7a05722e7c443212107b61.jpg)


如果未断掉当前远程登录状态就直接关闭 VS Code, 那么之后打开 VS Code 就会自动恢复上次的异常中断。下面演示如何手动关闭远程连接。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/cdeaf1de5cfebe708b26eb5697ff3b5b4c257ae4591faaea5f88265263bbd543.jpg)


# VS Code 终端

打开终端方式一：

在顶部工具栏中选择终端、新建终端。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/93b97464d1ad4ed3a64ddbc32b14d8cc92aef6853797cb9641fe97249ff186c8.jpg)


打开终端方式二：

或者使用快捷键：“Ctrl + ~”在VS Code中打开终端。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/52b9a5f1bfe352a6840861b8254d91aa6c277b2e2866cd77fd530d5c349c5f09.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/bb6342e7a47db6b7c8d56498115bcdd392256f0c8552e0d47ac8b6a85a3a4e94.jpg)


若当前终端被占用，可增加多个终端。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/be833d68a2393b44a2c962a6a1f652b96bae03101d6854791867213549836588.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/e70da4fdc5f13592fbceffe440742a42c7fc2f4c187a11a7ffc28c286042849b.jpg)


# 1.1.3 Flask 框架

Flask 是一个基于 Python 的轻量级 Web 应用框架，以其简洁灵活的设计理念受到开发者广泛欢迎。它提供了核心的请求-响应处理与路由功能，允许开发者通过丰富的第三方扩展（如数据库集成、表单验证、用户认证等）按需构建复杂应用，既适合快速搭建原型与 API 服务，也能支撑企业级产品开发。许多知名公司如 Netflix、Uber、豆瓣网以及字节跳动的部分后台系统均采用 Flask 构建高效可靠的服务，体现了其在生产环境中的强大扩展性与实用性。

# 安装 Flask

可使用VSCode终端直接安装Flask，如在本地VSCode中安装Flask。

pip install flask  $= = 2.3.2$

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/df36226fab80136fc59dcb5c0ba8e2f8843fb83b511cd81919276241aa5c2768.jpg)


# Flask 简单网站代码

新建app.py文件，并写入：

导入 Flask 类，用于创建 Web 应用

from flask import Flask

创建 Flask 应用实例，__name__表示当前模块名，用于确定应用根目录

app  $=$  Flask(name_）

使用装饰器定义路由，将URL路径'/'与下面的函数绑定

@app-route(/")

def hello_world():

# 当用户访问根路径时，返回字符串'Hello, World!'作为响应

return 'Hello, World!'

判断当前模块是否作为主程序运行（而不是被import导入）

if __name__ == 'main':

# 启动 Flask 开发服务器

host='0.0.0.0'：允许外部设备通过服务器IP访问

port=8080:监听8080端口

# debug=True 参数开启调试模式:

1. 代码修改后自动重启服务器

# 2. 提供详细的错误页面

3. 禁用生产环境优化

根据上面的app.py可以清楚地看到，其实Flask核心代码主要分为三部分。第一部分是创建Flask应用实例对象；第二部分是对浏览器访问网站的URL进行处理并返回相应的内容（路由系统），上面案例中直接返回字符串，真实环境中将返回指定的HTML页面或跳转到其他页面；第三部分主要负责网站对外开放的IP和端口等基本信息。

在 VS Code 中启动上述 app.py，根据提示，可以看到网站已部署到本地 8080 端口。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/3695238cb003e80899405ee37da87b766cf1c93913a0e0612dfaf429ed6924ad.jpg)


选择 http://127.0.0.1:8080,CTRL+鼠标点击直接打开该连接，或复制到浏览器中访问，所能看到的就是 Flask 框架呈现的一个最简单案例。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/3093b818ebc5c1a8d052b127b9d604913770d8773de9a325cf60c78a04adf36b.jpg)


Hello, World!

# Flask 路由系统

路由（路径）是Web应用中定义URL与处理函数之间映射关系的核心机制。

Flask 中@app.route 的第一个字符串参数叫做 URL，被@app-route 装饰的函数叫做视图函数。通过以下 6 个案例来讲解 Flask 中基本的路由设定。

```txt
app.py
```

```python
from flask import Flask, request, jsonify
```

```txt
app = Flask(name)
```

```txt
##案例1
```

```txt
@app.route('/')
```

```txt
这里的'/'就是URL
```

```python
def home():
```

```txt
这里的home()就是视图函数
```

```lua
return '欢迎来到首页！'
```

```txt
##案例2
```

```txt
@app.route('/hello')
```

```txt
@app-route('/hi')
```

```txt
@app.route('/greet')
```

```txt
def greet():
```

```txt
return '你好！访问 /hello 或 /hi 或 /greet'
```

```txt
##案例3
```

```txt
@app.route('/user/<username>'
```

```txt
def show_user_profile username):
```

```javascript
return f 用户: \{username\} 的个人主页
```

```txt
##案例4
```

```txt
@app.route('/post/<int:post_id>'
```

```python
def show_post(post_id):
```

```txt
return f'文章ID: {post_id}' 的内容'
```

```txt
##案例5
```

```txt
@app.route('/api', methods=['GET', 'POST'])
```

```txt
def handle_api):
```

```python
if request.method == 'GET':
```

```javascript
return jsonify({'method': 'GET请求成功'})
```

```txt
else:
```

```txt
return jsonify({'method': 'POST请求成功'}), 201
```

```txt
##案例6##
```

# /photos "拍照"这个功能按钮

@app.route('/photos')

def take.Photo():

return "点击这里拍照"

# /books/ "所有书"的列表

@app.route('/books/'

def view_books():

return ""

你的所有书：

-书1.jpg

-书2.jpg

-书3.jpg

1

```python
if __name__ == 'main':
```

```txt
app.run(host='0.0.0.0', port=8080, debug=True)
```

# 1. 基本路由（默认路由）-绑定首页函数

@app.route('/')

def home():

return '欢迎来到首页！'

作用：当用户访问 http://127.0.0.1:8080/ 时触发，通常作为网站的入口点，对应服务器的根目录。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/2e09497c95eff76db8ba30cb85074909a1c5048bc9ecf347999109137233bd81.jpg)


# 欢迎来到首页！

# 2. 多个路由规则绑定同一个函数

@app.route('/hello')

@app.route('/hi')

@app-route('/greet')

def greet():

return '你好！访问 /hello 或 /hi 或 /greet'

作用：URL别名：多个URL指向同一功能，向后兼容：保留旧URL的同时使用新URL，用户体验：提供多种访问方式。

示例：访问 http://127.0.0.1:8080/hello、http://127.0.0.1:8080/hi、http://127.0.0.1:8080/greet 都返回同一页。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/80130cb5e5188051f7522b519065c53038c0825ffd46c33c5ba52f6384cb2199.jpg)


你好！访问/hello或/hi或/greet

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/ef42f9ff9f609e3bbb89bca9d994a2e76865e61c192ae9b55280142880d5037c.jpg)


你好！访问/hello或/hi或/greet

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/49cbe40530194050144919ced84c873f5d32d0d1a71e9f013bc00504eb93827f.jpg)


你好！访问/hello或/hi或/greet

3.动态路由-绑定用户页面函数

@app.route('/user/<username>'

def show_user_profile username):

return f 用户: {username} 的个人主页

作用：URL模式匹配：匹配 /user/后任意非斜杠字符，参数传递：<username>捕获URL中的值传递给函数，实际应用：用户个人主页、商品详情页等

示例访问：

http://127.0.0.1:8080/user/admin  $\rightarrow$  显示“用户：admin的个人主页”。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/13c286fd63b8507d6f713d47ba3193f615bcde735b8dec4f61a428d00bd1cd9d.jpg)


# 用户：admin的个人主页

http://127.0.0.1:8080/user/admin/1  $\rightarrow$  “404错误”。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/3c665f107857fa43492c3ad0d65f1147f71b6a51d92f1fe8e0332c2ae72d94e6.jpg)


# Not Found

The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.

4. 类型转换 - 绑定文章详情函数@app.route('/post/<int:post_id>'

@app.route('/post/<int:post_id>')

def show_post(post_id):

return f'文章ID: {post_id} 的内容'

作用：1. 类型验证：确保 post_id 是整数；2. 自动转换：将字符串参数转换为指定类型。

类型保护：/post/abc会返回404错误（不是整数）。

支持的类型：

int: 整数

float:浮点数

path: 包含斜杠的字符串

uuid: UUID字符串

例如访问：

https://127.0.0.1:8080/post/123  $\rightarrow$  显示"文章ID：123的内容"

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/568c20e0bae68dd5eaf0efd87cbb8f2aa271ad3a700580497ab301343f389bf2.jpg)


# 文章ID：123的内容

https://127.0.0.1:8080/post/abc  $\rightarrow$  404错误

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/a9d041dcda99952b372a58d535dd4ac16aaf6034880ba38c56b041418da9ae37.jpg)


# Not Found

The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.

https://127.0.0.1:8080/post/  $\rightarrow$  404错误

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/9eb745b2a281d810f6b3e27d27c32352a3a2e2dd02441a536722c07fd9e0878a.jpg)


# Not Found

The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.

# 4. 多方法路由 - 绑定 API 函数

@app-route('/api', methods=['GET', 'POST'])

def handle_api():

if request.method == 'GET':

return jsonify({'method': 'GET请求成功'})

else:

return jsonify({'method': 'POST请求成功'})，201

作用：HTTP方法区分：同一URL根据请求方法执行不同逻辑；RESTful API设计：符合REST架构风格。

示例：

GET方式：

http://127.0.0.1:8080/api  $\rightarrow$  获取数据

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/f309004975a5942e2b6a8f3c93e4bb4dd6458d2149004c5e5e028ad6d73f4b00.jpg)


POST方式：

http://127.0.0.1:8080/api  $\rightarrow$  创建数据

浏览器默认使用GET方法，这里使用Curl命令。状态码控制：POST请求返回201（Created）状态码。

```batch
C:\>curl -i -X POST http://127.0.0.1:8080/api   
HTTP/1.1 201 CREATED   
Server: Werkzeug/3.1.4 Python/3.14.2   
Date:Thu,08 Jan 2026 03:28:55 GMT   
Content-Type:application/json   
Content-Length:47   
Connection:close   
{ "method":"POST\u8bf7\u6c42\u6210\u529f"   
}
```

返回的内容中出现了Unicode编码的结果，可使用在线网站来翻译对应的中文内容。https://www.jyshare.com/front-end/3602/

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/e762ee6c85f8c98e3859e66cc896dbdf870fb63dc0a1de01bbc3b9e9c4da1332.jpg)


# 6. 路径参数带斜杠

无斜杠通常用于表示一个具体资源或操作；有斜杠表示这是一个“目录”或资源集合。

# /photos "拍照"这个功能按钮

@app.route('/photos')

def take.Photo():

return "点击这里拍照"

# 访问结果:

# /photos

$\checkmark$  显示内容

# /photos/

X 404 错误

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/822c4cfbb7bfe1fab007a372207e35f795e95300c8ecd293487f78dcce5a6ed1.jpg)


# 点击这里拍照

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/1771033eb7081bbb409939724e5965dbcf510c9ad8a2519fba9c9f22b09a300d.jpg)


# Not Found

The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.

```python
# /photos/ "所有照片"的列表  
@app-route('/books/'）  
def view_books(): return ""
```

# 你的所有书：

-书1.jpg

- 书2.jpg

- 书3.jpg

1

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/fc5e8950559c8b1205c70c4ce222e8a785ccc45750329bf4aea7b2bbae535154.jpg)


你的所有书：- 书1.jpg - 书2.jpg - 书3.jpg

# 访问结果:

# /books 自动301重定向到 /books/

# /books/  $\checkmark$  显示内容

# Flask 文件目录结构

Flask 项目结构/

```txt
app.py #主应用文件  
xxx.py #自定义功能模块  
requirements.txt #依赖列表  
static/ #静态文件  
css/ #CSS样式文件  
js/ #JS样式文件
```

images/ #图片 templates/ #模板文件 index.html #html文件

app.py 是 Flask 应用的入口和核心控制文件，它负责：

1. 创建 Flask 应用实例 - 初始化整个 Web 应用

2. 配置路由和视图函数 - 定义URL与处理逻辑的映射关系

3. 整合各个模块 - 导入并使用 xxx.py 中的自定义功能

4. 启动开发服务器 - 运行 Flask 应用

与其他文件的关系：

1. 调用 xxx.py 中的业务逻辑和工具函数

2. 渲染 templates/ 中的 HTML 模板并返回给客户端

3. 引用 static/ 中的 CSS、JS、图片等静态资源

4. 依赖requirements.txt中列出的Python包运行

简单说：app.py像是项目的大脑，它接收请求、协调各模块工作、返回响应，将MVC架构中的Controller（控制器）角色。

# Flask 模板渲染与重定向

上面我们举的例子都是页面返回字符串，但是真实环境中，网站返回的是网页。Flask中的网站页面使用的是HTML文件，HTML（超文本标记语言）是构建所有网页和网络应用最基础、最核心的骨架代码。

超文本：指的是它不仅包含文字，还能包含链接，可以跳转到其他文档、图片、视频等，形成一个互联的“超”网络。

标记语言：它不是编程语言，而是一种用标签来“标记”内容的语言。标签用来告诉浏览器某段内容是什么（比如是标题、段落还是图片）。

HTML 使用由尖括号  $<$  包围的标签来工作。标签通常是成对出现的但也有非成对的，如：

<p>和  $\langle /p\rangle$  定义了一个段落。

<strong> 和 </strong> 定义重要文本，通常显示为加粗。

$< \mathrm{a}>$  中可定义一个超链接，href属性指定了链接地址。

< img> 定义了一张图片，src 属性指定了图片来源，alt 是替代文本。

每个 HTML 网页都遵循一个标准结构，这里使用 VS Code 创建一个 HTML 文件。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/33ef3168f855c01bce3259852bc627103332a76abc5c33b1e380ba9370883f87.jpg)


在html.html中写入以下内容：

<!DOCTYPE html> <!-- 声明文档类型为 HTML5 --->

<html lang="zh-CN"> <!-- 根标签，lang属性定义语言为中文-->

<head>

<!-- 头部：包含元信息，不直接显示在页面上 --->

<metacharset="UTF-8"> <-- 定义字符编码，防止乱码 -->

<title>我的第一个网页</title> <!-- 浏览器标签页上显示的标题 --->

<link rel="stylesheet" href="style.css"> <!-- 链接外部 CSS 样式表 -->

</head>

<body>

```html
<!-- 主体：所有显示在网页上的内容都放在这里 -->
<h1>这是一个一级标题</h1>
<p>这是一个段落，包含一个<a href="http://www.baidu.com" target="_blank">链接</a>。</p>
<img src="logo.png" alt="网站 Logo">
<script src="script.js"></script> <!-- 链接外部 JavaScript 文件 -->
</body>
</html>
```

右击html.html文件，点击打开方式，选择任意浏览器打开。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/95db6e04f382b6fdce327b352289b6b413642d84e9ac6317fbb5a28ae2a26d0f.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/b5fb10edd690cc41d384be50b393415173b320e0ef345533f549025eb4a00462.jpg)


# 这是一个一级标题

这是一个段落，包含一个链接。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/bff760f33d844e6ff96fa1a1e9b6d1625305342bba746517e39b8e22e1386502.jpg)


HTML、CSS、JavaScript关系

# 1. HTML: 结构与骨架

角色：盖房子的砖瓦和钢筋。它定义了网页有什么内容，以及这些内容的基本结构。

功能：创建段落、标题、图片、链接、列表、表格等元素。它搭建出网页的“毛坯房”。

比喻：

</h1> 是房子的门牌（标题）。

$< \mathrm{p}>$  是房间里的一段文字。

<img>是墙上挂的一幅画。

$< a >$  是通往另一个房间的门（链接）。

没有它：网页将没有任何内容，一片空白。

# 2. CSS: 外观与装修

角色：房子的装修和装饰。它负责让网页变得美观。

功能：控制 HTML 元素的颜色、字体、大小、间距、背景、布局（如并排、居中）等所有视觉样式。

比喻：

把标题  $< / \mathrm{h} 1>$  刷成红色，字体变大。

把段落  $< / \mathrm{p}>$  的文字调成舒适的灰色和行高。

把图片  $< / \mathrm{img}>$  加上一个圆角边框和阴影。

决定客厅（一个区域）和卧室（另一个区域）如何并排布局。

没有它：网页会像一份没有任何格式的纯文本文档，只有最基本的结构，非常丑陋。

# 3. JavaScript: 功能与交互

角色：房子的水电、智能系统和管家。它让网页“动”起来，能响应用户。

功能：实现所有动态功能和交互逻辑。例如：点击按钮弹出菜单、轮播图自动切换、表单验证、从服务器获取新数据并更新页面部分内容等。

比喻：

按下电灯开关（点击按钮），灯就亮了（显示/隐藏内容）。

门铃响了（事件触发），你去开门（执行函数）。

恒温器（JS逻辑）根据室温自动调节空调（动态更新页面数据）。

管家（JS）可以根据你的指令，从仓库（服务器）取一件新家具（数据）放进房间（更新DOM）。

没有它：网页是静态的、无法交互的“宣传册”，用户只能看，不能进行任何操作。

模板渲染是将数据嵌入 HTML 后返回给用户，而重定向是让浏览器自动跳转到另一个 URL 地址。

模板渲染：服务器生成完整 HTML  $\rightarrow$  用户看到新内容（URL 地址不变）

重定向：服务器返回“跳转指令”  $\rightarrow$  浏览器请求新地址  $\rightarrow$  用户看到新内容(URL 地址变化)

核心区别：渲染是直接给结果，重定向是让浏览器换个地方要结果。

Flask中一般使用下面的三个函数控制返回的html页面：

<table><tr><td>函数</td><td>作用</td><td>返回值</td><td>常见使用场景</td></tr><tr><td>render_template()</td><td>渲染指定的HTML模板文件</td><td>HTTP响应（HTML页面）</td><td>显示页面内容</td></tr><tr><td>redirect()</td><td>重定向到其他URL</td><td>HTTP重定向响应</td><td>页面跳转、表单提交后</td></tr><tr><td>url_for()</td><td>根据视图函数名生成URL字符串</td><td>字符串（URL）</td><td>在模板或代码中生成链接</td></tr></table>

通过下面的简单例子来解释上面三个函数的使用方法，假设 Flask 项目结构、app.py、hello.html 文件内容如下：

app.py

templates/

hello.html


app.py


```python
from flask import Flask, render_template, redirect, url_for
```

```txt
app = Flask(name)
```

```txt
@app.route('/nihao/'
```

```txt
@app.route('/nihao/<name>')
```

```txt
def saynihao(name=None):
```

如果没有传入name参数，使用默认值"小明"

```txt
if name is None:
```

```txt
name = "小明"
```

```lua
return render_template('hello.html', name=name)
```

# 重定向1：使用固定参数

```txt
@app-route('/gonihao')
```

```python
def go_nihao():
```

```markdown
# 重定向到/nihao/小红
```

```lua
return redirect('/nihao/小红')
```

# 重定向2：使用url_for带参数

```css
@app-route('/gosayhello')
```

```txt
def go_sayhello():
```

```markdown
# 重定向到/nihao/小刚
```

```lua
return redirect(url_for('saynihao', name='小刚'))
```

```python
if __name__ == 'main':
```

```txt
app.run(host='0.0.0.0', port=8080, debug=True)
```


hello.html


```html
<!DOCTYPE html>   
<html>   
<body> <h1>你好，{name}！</h1> <p>这是一个最简单的Flask页面</p> <!--方法1：通过查询参数传递--> <ahref="{}url_for('say.nihao','name='小东')"}点击回到首页（小东）</a> </body>   
</html>
```

使用Python运行app.py，访问效果如下：

1. 访问 http://127.0.0.1:8080/nihao/, 若未接收到参数将使用默认参数值,该案例中的默认参数值是"小明"。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/9db1c4c448e714eeb62a8ad2c22143416d3665943566df8d8eaa044ba12c62f0.jpg)


# 你好,小明！

这是一个最简单的Flask页面

点击回到首页 (小东)

2. 假如指定参数为"小李", 如访问: http://127.0.0.1:8080/nihao/小李

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/d2658346d4111bb3b89f12eac2e816e0ac3c06adb784ed807831f50a7c48ad94.jpg)


# 你好，小李！

这是一个最简单的Flask页面

点击回到首页（小东）

3. 访问 http://127.0.0.1:8080/gonihao

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/d881e9d62932790528d50c8c4b474604f6216e22ba5772f5a48aac70c9b61b72.jpg)


# 你好，小红！

这是一个最简单的Flask页面

点击回到首页（小东）

4. http://127.0.0.1:8080/gosayhello

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/f692cbcc12693821a8a4bfcb6cd2cf8b428bba6aff67c655a4c58b294561e595.jpg)


# 你好，小刚！

这是一个最简单的Flask页面

点击回到首页（小东）

5. 点击“点击回到首页（小东）”

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/ecee61d77ee6a4ada2a499da3759180ce12db68ed15dc9fa52b15dffd545a768.jpg)


# 你好，小刚！

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/ad5ec977cc2436b3347447d653ed2406600df233cfc013dc819cb5d725bfac8f.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/498b34af2fbad8109749cc7e31c8c70f886d1e763254898973494ecbd481d4a2.jpg)


# 你好，小东！

这是一个最简单的Flask页面

点击回到首页（小东）

# Flask 模板继承

Flask中的模板继承是一种DRY（Don't Repeat Yourself）的设计模式，它允许你创建一个基础模板（base template）来定义网页的通用结构（如页头、导航栏、页脚等），然后让其他子模板继承这个基础模板并只填充各自独特的内容区域。这就像制作印章：基础模板是印章的底板，定义了固定不变的边框和样式；子模板则是每次盖章时填入的不同文字内容。通过使用{ $\%$  block  $\%$ }标签在基础模板中定义可替换的内容块，子模板用{ $\%$  extends  $\%$ }声明继承关系后，只需用相同的{ $\%$  block  $\%$ }标签重写需要变化的部分（如页面主体），而无需重复编写整个HTML结构。这样既保持了网站风格的一致性，又大大减少了代码重复，让维护和修改变得更加高效。

通过下面案例来讲解 Flask 中模板基础，假设 Flask 项目结构：app.py、base.html、home.html、about.html 如下所示，在 base.html 中定义了一个网站的导航栏，网站的所有页面中都需要使用这个导航栏，那么在该网站的其他 HTML 页面只需要使用  $\{\%$  extends "base.html"  $\%\}$  就能直接导入这个导航栏，不同的是，除过导航栏一样，页面中的内容可使用  $\{\%$  lock  $\%\}$  和  $\{\%$  endblock  $\%\}$  实现自定义效果。

flask_template_demo/

app.py

templates/

base.html

基础模板

home.html

# 首页（继承base）

about.html

# 关于页面（继承 base）


app.py


```python
from flask import Flask, render_template
```

```txt
app = Flask(name)
```

```txt
@app.route('/')
```

```python
def home():
```

```lua
return render_template('home.html')
```

```txt
@app.route('/about')
```

```txt
def about():
```

```lua
return render_template('about.html')
```

```python
if __name__ == 'main':
```

```txt
app.run(host='0.0.0.0', port=8080, debug=True)
```


templates/base.html（基础模板）


```html
<!DOCTYPE html>   
<html>   
<head> <meta charset="UTF-8"> <title>简单的 Flask 网站</title> <style> body { margin:0; font-family: Arial; } .nav { background:#333; padding:10px; }
```

```html
<div class="nav"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="page"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="footer"><div class="header"><div class="header"><div class="header"><div class="header"><div class="header"><div class="header"><div class="header"><div class="header"><div class="header"><div class="header."< img src=""></body></html>
```

templates/home.html（首页－继承base）

```txt
$\{\%$  extends"base.html"  $\%\}$
```

```txt
$\{\%$  blockcontent  $\% \}$    
<h1>欢迎来到首页</h1>  
<p>这是网站的主页面。</p>  
<p>我只写了内容，导航和页脚都是base.html提供的。</p>  
<h2>特点：</h2>  
<ul>导航栏自动显示</li>  
<li>页脚自动显示</li>  
<li>我只需关注内容</li>  
</ul>  
 $\{\%$  endblock  $\% \}$
```

templates/about.html（关于页面-继承base）

```txt
$\{\%$  extends"base.html"  $\%\}$
```

```latex
$\{\% \text{block content}\}$
```

```txt
<h1>关于我们</h1>
```

```txt
<p>这是关于我们的页面。</p>
```

```txt
<h2>联系我们：</h2>
```

```txt
<p>邮箱：example@email.com</p>
```

```txt
<p>电话：123-456-7890</p>
```

```txt
<h2>办公时间：</h2>
```

```txt
<p>周一至周五：9:00- 18:00</p>
```

```txt
$\{\%$  endblock  $\%\}$
```

# 效果示例：

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/5b59383217b0453a50fe5c39a6135c058bbe91d97faa7f2db4dedf9a285744c8.jpg)


# 欢迎来到首页

这是网站的主页面。

我只写了内容，导航和页脚都是base.html提供的。

# 特点：

·导航栏自动显示

·页脚自动显示

·我只需关注内容

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/e6d11f0806b8deb21e73b28e065de2587586c3d0331c65f7fbb25b3df98c8b77.jpg)


# 1.1.4 HTML 实践作业

任务要求：创建个人学习笔记页面

请使用 Flask 创建一个关于 Web 开发学习的个人笔记页面。页面需包含以下所有元素：

1. 不少于 3 个路由, 且必须包含动态路由;

2. 不少于 3 个 HTML 页面, 必须包括默认页面, 且不少于 10 种标签, 页面之间能相互跳转, 页面中必须包括超链接、图片、title 等标签;

3. 需要使用到 Flask 重定向功能；

4. 需要使用到 Flask 模板继承功能。

# 1.1.5 Git 工具

Git 是一个开源的分布式代码、文档管理系统，常用于团队协作，本实验用通过 Git 获取实验代码。它通过记录文件快照的方式来追踪项目内容的变更，允许开发者在本地拥有完整的代码仓库和历史记录，从而支持灵活的离线工作、高效的分支创建与合并，是现代软件开发中不可或缺的协作与版本管理工具。

$\approx$  https://git-scm.com

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/977c3def0042d5c9fc17001fcafb5a325a3590dcaf6346bbd9a652e4f6dab35c.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/9582614269c828a7b75a847f1018229702990ea19c840cc5cc419e4aa2d4a918.jpg)


--local-branching-on-the-cheep

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/55b82bfebdfb396876ec3aedff4902d2fe2085963f88f12c0130a5dc4a18e0ad.jpg)


Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

Git is lightning fast and has a huge ecosystem of GUIs, hosting services, and command-line tools.

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/0ae35f8d67424df0c05908a649a3860f8ecf8176fc2ecb8bcde3094a00a07980.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/31701cbdb27cad132bdb2ca556f6435c7b21744ad06c02c38dee9a3dbb249a90.jpg)


# About

Git's performance and ecosystem

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/5d34aa9e70d782e1418209bc34f998b51cf715e155db4810f917efef15c6c618.jpg)


# Learn

Pro Git book, videos, tutorials, and cheat sheet

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/54e02533ad622882db41a21821e4bf7fc834696c4e93ae7a67e55acaf407f928.jpg)


# Tools

Command line tools, GUIs, and hosting services

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/0b2bdd3b939d196f812f1522593a1e281ba0ea90becefab3d5fd6aa9ac9acdde.jpg)


# Reference

Git's reference documentation

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/0e87029405dac1f99d3ba6a4162b6da7ad32540a6d99fde53abe8bcdb391bafd.jpg)


# Install

Binary releases for all major platforms.

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/24b4b1b93c9f84513d1ccb0c3e07cddf31d8014ec2594589be936aaa36220729.jpg)


# Community

Get involved! Bug reporting, mailing list, chat, development and more.

# Latest source release

2.52.0

Release Notes (2025-11-17)

Install for Windows

GitHub Repository

$\approx$  git-scm.com/installWINDOWS

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/4c99260b557efd613975e68d1b04af473483745b203fc1eee7fc60f644cef45b.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/44bb342e303098314e190f3adbf021cf4b4435ff1ecd712268630f1195dc2132.jpg)


--local-branching-on-the-cheap

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/0f8e5c2932f4867e6ee7478c7075a8f4550c2c1e7efd052bdcbe15d376b83044.jpg)


Type / to search entire site...

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/a77e1c546db815db361841918577955944e424d48d275e7718d454dfef86cc61.jpg)


# Install

Latest version: 2.52.0 (Release Notes)

# About

# Learn

# Tools

# Reference

# Install

# Community

The entire Pro Git book

written by Scott Chacon and Ben Straub is available to read online for free. Dead tree versions are available on Amazon.com.

Windows

macOS

Linux

Build from Source

Click here to download the latest (2.52.0) x64 version of Git for Windows. This is the most recent maintained build. It was released 41 days ago, on 2025-11-17.

# Other Git for Windows downloads

Standalone Installer

Git for Windows/x64 Setup.

Git for Windows/ARM64 Setup.

Portable ("thumbdrive edition")

Git for Windows/x64 Portable.

Git for Windows/ARM64 Portable.

Using winget tool

Install winget tool if you don't already have it, then type this command in command prompt or Powershell.

winget install --id Git.Git -e --source winget

The current source code release is version 2.52.0. If you want the newer version, you can build it from the source code.

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/99a8c62d88288e7d0e5410eecb585225c7adf8fc073abfadc870c77f2b14de84.jpg)


双击Git-2.52.0.-64-bit.exe，都选择默认点击下一步就行。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/a21fd1f6c8c10573d98623b283bdfb964fa959e1ed9d6fa16524cb987759d987.jpg)


# Select Components

Which components should be installed?

Select the components you want to install; clear the components you do not want to install. Click Next when you are ready to continue.

Additional icons

On the Desktop

Windows Explorer integration

- - Open Git Bash here

Open Git GUI here

Git LFS (Large File Support)

Associate .git* configuration files with the default text editor

Associate.sh files to be run with Bash

Check daily for Git for Windows updates

Add a Git Bash Profile to Windows Terminal

$\mathbb{O}$  Scalar (Git add-on to manage large-scale repositories)

Current selection requires at least 346.3 MB of disk space.

https://gitforwindows.org/

Back

Next

Cancel

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/c90ac26119db1e71addbc644a2189dce0ddef69a9fbf80924352b25fc7ef8446.jpg)


Git 2.52.0 Setup

# Choosing the default editor used by Git

Which editor would you like Git to use?

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/0878653738fc5266ebdbf02bb9d766521300b782dbd5dac337d559a114cbbb4f.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/03c8b0660b6195b7402f7359d5c5eabd1ccde25d3c213b856d45529f49bfa1a0.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/1821205731fd40ec832bc530fb7830531fe2290589444b13bb193dc14dd62576.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/0dc3ad88ccfd025ec9bb0485e4b9b5b34e649ac7865feb9b1ba26f0f64e1b532.jpg)


Use Vim (the ubiquitous text editor) as Git's default editor

The Vim editor, while powerful, can be hard to use. Its user interface is unintuitive and its key bindings are awkward.

Note:

Note: Vim is the default editor of Git for Windows only for historical reasons, and it is highly recommended to switch to a modern GUI editor instead. Note:

Note: This will leave the 'core.editor' option unset, which will make Git fall back

https://gitforwindows.org/

Back

Next

Cancel

# Adjusting the name of the initial branch in new repositories

What would you like Git to name the initial branch after "git init"?

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/aeda7aabc760d18f9b6528ed956420b9a643fb8950cf1f0de8598ad6cbef0a94.jpg)


# Let Git decide

Let Git use its default branch name (currently: "master") for the initial branch in newly created repositories.

# $\bigcirc$  Override the default branch name for new repositories

Many teams already renamed their default branches; common choices are "main", "trunk" and "development". Specify the name "git init" should use

main

This setting does not affect existing repositories.

https://gitforwindows.org/

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/99338368dd24ae94d516ebe9af786bacad20b3d7946569ce0b341f88a2746605.jpg)


Back

Next

Cancel

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/26f928df7eb3b3629b5c786f161f49ec380969af406fa1975414a3175cf54df9.jpg)


Git 2.52.0 Setup

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/5f9ee6bc5b95d79adddca017cfca8ae1e4762fd322a1a040611b9b71970dc88d.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/eff1937e1e4dc88f1c9bb82aa05816a6aea8da6942346986bceba04dd21a0f24.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/2f519dc3ec00db5be3161154ad81aa9a4c8d305007517a144e8357b9ec7b82ac.jpg)


# Adjusting your PATH environment

How would you like to use Git from the command line?

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/891d7a6430e86e7a1994929a85d7ce58636d447d5f0a89fbf17cf4610739e35c.jpg)


# $\bigcirc$  Use Git from Git Bash only

This is the most cautious choice as your PATH will not be modified at all. You will only be able to use the Git command line tools from Git Bash.

# Git from the command line and also from 3rd-party software

(Recommended) This option adds only some minimal Git wrappers to your PATH to avoid cluttering your environment with optional Unix tools. You will be able to use Git from Git Bash, the Command Prompt and the Windows

# $\bigcirc$  Use Git and optional Unix tools from the Command Prompt

Both Git and the optional Unix tools will be added to your PATH. Warning: This will override Windows tools like "find" and "sort". Only use this option if you understand the implications.

https://gitforwindows.org/

Back

Next

Cancel

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/4510069ca122e6b487632a0c54bb8effa028617bf468adde40ebbd892013693f.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/be5fe5ad7970df0d85c6d4a24dfb0c962c5a6c91a45a9ba0bb43d1abed82c9a6.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/aa3c7158f1e282d38050fcd5eee8e5a6f1b640bae6fbc4c84d91971c676e9d3b.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/e060a12e1e7f2fd057c0187217fe28a75945347fd4a22efddcd292d4cde9242a.jpg)


Git 2.52.0 Setup

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/3ecd9bca9a3fd19efcaf7ac7bbd0c3678f10a678e5625a0f21bdfa4ae949a552.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/ffea435d8e4ffefc59d768723f794c157c6b00913f22b2d3d18235c9a497e80e.jpg)


Choose the default behavior of `git pull`

What should 'git pull' do by default?

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/846f6116ae7ac035e84656c70b35c15963e52493e2a5d5c04cafc1c4789c2345.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/b70a6569eaa37e81fd244b5436d9b34c995be913022d09dc3d82849d6fb61a2e.jpg)


# Fast-forward or merge?

Fast-forward the current branch to the fetched branch when possible, otherwise create a merge commit.

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/8349c6ad1a206f1b897554e8494603e0bf86a7484ca238569fc92f316ede5a6d.jpg)


# Rebase

Rebase the current branch onto the fetched branch. If there are no local commits to rebase, this is equivalent to a fast-forward

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/7b9dd578efacc53f5fb3e43fa729b13391889549090783ddce6301054dfcc20a.jpg)


# Only ever fast-forward

Fast-forward to the fetched branch. Fail if that is not possible. This is the standard behavior of `git pull'.

https://gitforwindows.org/

Back

Next

Cancel

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/013705cfbb57e1122bf41fde8c35bb1e5ad48b88121eaefe3728eff0f0c233f3.jpg)


Git 2.52.0 Setup

# Choose a credential helper

Which credential helper should be configured?

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/d63b774c1fdf8276166fba9684f3f56db3dc5c68ecfc49bff23b8fe7b5c4be18.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/8b644f7a200f645aecccf8ecd76f7b58f281e4164b69d05881dd87e4842f5143.jpg)


# Git Credential Manager

Use the cross-platform Git Credential Manager. See more information about the future of Git Credential Manager here

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/e05501d8316736df2cedd86385a4747ff133b777ea70697306f648381c6d4ce6.jpg)


# None

Do not use a credential helper.

https://gitforwindows.org/

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/b0d1d538bc6709966eecae12f1018bd0be9443285d8e81176fd9e64a7f7d6c4d.jpg)


Back

Next

Cancel

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/541706d5f1820430f3e62c94fc63001b3d8bd5f6f538cbb8ccd185df1154e05a.jpg)


Git 2.52.0 Setup

# Configuring extra options

Which features would you like to enable?

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/731381f7d8136e725cfe3aa6ff6d2174af3c3e026bac0d2b52c37910e18f95ab.jpg)


# $\boxed{\mathbb{V}}$  Enable file system caching

File system data will be read in bulk and cached in memory for certain operations ("core.fscache" is set to "true"). This provides a significant

# Enable symbolic links

Enable symbolic links (requires the SeCreateSymbolicLink permission).

Please note that existing repositories are unaffected by this setting.

https://gitforwindows.org/

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/43c92ded174d9f0cf5c4e3980e4bfecb355c8e2127cf058ca8294e47e11a09f5.jpg)


Back

Install

Cancel

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/35c0c54688afb2cf4c20afb951cac9d9d9581ba96288b11c50f28f8287212390.jpg)


Git 2.52.0 Setup

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/cf806df8f7ea76490facd7452ae83947faafa4bce3d78f3f06548249fe62d525.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/fd5168c1eb93d66975ef185959b5f2d4c17c464014c6bddf05f93121cdd5bbd2.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/4d64cc34f010308caf82760de62a0d08fba7a13713b2ad83026d63b3f1684441.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/fa223c6a7f425ca7d170f8ec138fcc39f3af4bb23a7c99230a13e22124794110.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/6c5e4420765d67816e8bbdc8ea63b798ac175ee9d1186f8815da5e27e07cd513.jpg)


# Completing the Git Setup Wizard

Setup has finished installing Git on your computer. The application may be launched by selecting the installed shortcuts.

Click Finish to exit Setup.

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/b32c72aee35e70e98669356c2cf8ef44962fcdd1e7ab9d484019864dd0135b31.jpg)


Launch Git Bash

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/b1bce42c2ab10e5c59e0bc8aaaab215076b4fe39bf50e9c6e7cb2db8a7619031.jpg)


View Release Notes

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/bfcba2ad6d05398a403e3d1b8a9f646b7fad5e7ecdd3149287a6a10d8686e3be.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/9d05fbf6eacaaab966416d0a2f79c8d8c31ed935ae25e8fb84b6dbb4d9fc7a43.jpg)



Finish


安装完成后，在任意文件夹中的空白位置，可以看到鼠标右键菜单增加了两个关于Git的选项。

同时，Git指令已被加入环境变量，可在任意终端被识别。点击Open Git Bash here。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/05f154971b749ee23f370fb4a6905cb312ab63d90e078c387906979ae37dbaa3.jpg)


在Git Bash中可执行Linux相关命令，也就是说在Windows上通过Git Bash能实现执行Linux的效果。例如下面的id（查看用户和组信息）命令原本只能在Linux/Unix系统上执行。

```txt
MINGW64:/d/Git
awei@WHM MINGW64 /d/Git
$ id
uid=197609(awei) gid=197121 groups=197121
awei@WHM MINGW64 /d/Git
$
```

除了通过点击 Open Git Bash here，还可以在 CMD 中直接 Git 命令进行操作，使用 Git 克隆 Github 或 Gitee（中国版 Github）中的项目：

git clone https://<项目名称>.git

例如：使用Git克隆Github中一个叫flask的项目。

```txt
PS C:\> git clone https://github.com/pallets/flask.git  
Cloning into 'flask'...  
remote: Enumerating objects: 25849, done.  
remote: Counting objects: 100% (99/99), done.  
remote: Compressing objects: 100% (50/50), done.  
remote: Total 25849 (delta 73), reused 49 (delta 49), pack-reused 25750 (from 3)  
Receiving objects: 100% (25849/25849), 11.10 MiB | 2.00 MiB/s, done.  
Resolving deltas: 100% (17276/17276), done.
```

由于当前执行命令的路径是 C:\，所以下载完成后在 C:\中就能看到 flask 的文件夹。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/89e92706285ad6556644c70819685dc4f232ae7d1098dfc14e2324c2ded3eabf.jpg)


# 1.1.6 从 DataCon 竞赛平台获取实验所需云服务器

DataCon是由清华大学和奇安信联合发起的面向高校学生和数据安全分析爱好者的专业数据安全竞赛社区。本次活动学生所需使用的服务器通过 DataCon平台获取、管理。

# 平台注册

平台地址：https://www.datacon.org.cn/

首页：接受必需项，点击注册，进行账号注册。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/d3e3194bfe5607b53bb567929e315027282232963e1403ca4cf4e938904a4ef2.jpg)


注册方式支持：手机号注册，邮箱注册。

输入账号名，密码，手机号验证码，即可注册账号。同时也支持邮箱注册，点击邮箱注册可以进行切换。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/bf5830347688c85f2ee924a66b27a9efc24cc34f101bed647995381fbce7a388.jpg)


注册成功后，使用注册账号，登录平台。

# 报名赛事

点击所有赛事，查看待参与赛事。

选择参与赛事：以现场公布的赛事名称为准。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/7af9f91d9a658f4f7d768c8c97b91a3874973f8edbb150ea5f1196779681843e.jpg)



全部赛事


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/b4a04c26789c4ec062836d6346512590a4efcf348e47ce8d90320f597ce6837a.jpg)


通过报名连接，也可以直接访问赛事报名页面

报名链接以最新公布为准。

点击立即报名，进入战队信息填写弹窗

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/d2693919bd35f62fef09d78bff09d34bf38519f9629661c714a357d5280455d4.jpg)


战队名称，战队logo为必填。其他字段，可根据实际情况进行填写。报名成功后，在页面即可见自己的战队。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/d67c98dc778436f56b8cf999d484ce8fd1d4d5ac577604e6f7d7bde5fcfc605a.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/b21da3cd07bebe22de8e5c2bb45493dcdcda0af0c42057cf73b10c97f3407d27.jpg)


# 赛事系统

比赛开始后，即可在赛事系统中，题目的描述里，查看到自己分配到的云服务器地址。

具体操作如下：

# 1. 点击【进入比赛】

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/9949bcdfc6544f4974da6f39e649281a537c5c9f3334f22259d7e600a8ea7d1e.jpg)


# 2. 在赛事系统页点击赛题解答

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/059ee8d77d59a90306ee3eb1d5773a6c1ad4176a0d8b3ee51db8deb98639ed97.jpg)


3. 进入赛题解答页后，点击赛题，弹出赛题弹框

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/17a3eb2edda0c58fbab94c89b20410d56efdd49e6dee722b2f286b56eeb69363.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/d57fa7f018cfadc885c5ab267b2f22eb5d3a502ba4a5584b85e83cee35cc3f44.jpg)


4. 出现赛题弹框后，点击赛题解答，进入赛题解答页面

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/38a5ed7f0148db74e4bcad75f390f39ccee7557574375019d0ec9ffb5b52baf3.jpg)


5. 点击打开虚拟环境，获取虚拟环境，这个过程可能页面需要加载一分钟，出现终端样式时，加载成功。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/bbbcd51c7372087b2a6ef13d3727e6f527086d689499c1da0ce3b9a2bfc31859.jpg)


6. 点击页面 ssh 按钮，可以查看云服务器的 IP 地址，连接账号，连接密码，通过终端进行云服务器连接。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/27607b3120d4b32a79764527e5dd6a1fb9e1be43f43b7a085d7beda3cbc53865.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/15a2225e96d472edc8e74efd49810cd9a887427266a3cd1d2c8315c863322335.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/3aa26d2b2b221c1498ff5f22fdec07ccea0ee099daa69a8236f415dd690cf293.jpg)


7. 虚拟环境操作页，支持重启，关机云服务器，点击上方的重启，关机，重置登录密码。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/be6e1fb436708baedd157014f569b50e0e28c637188ba62fea7201d05c9411d9.jpg)


# 1.1.7 阿里云服务器购买（扩展内容，按需）

阿里云服务器（ECS，Elastic Compute Service）是阿里巴巴集团旗下阿里云提供的核心云计算服务之一，它是一种安全可靠、弹性可伸缩的云端虚拟服务器。用户可以根据业务需求灵活选择CPU、内存、操作系统和网络配置，并实现分钟级快速部署与按需付费，有效降低IT成本。ECS不仅提供高性能计算能

力、多种实例规格和丰富的镜像选择，还集成了云硬盘、安全组、快照备份等企业级功能，广泛应用于网站搭建、应用开发、数据处理、企业服务等高可用、高弹性的计算场景，是企业与开发者上云实现数字化转型的基础设施支撑。

本次课程中服务器是直接由 DataCon 平台提供，冬令营结束一段时间后失效。本次活动结束后学生如果想要维持网站长期使用，可自行购买云服务器，访问阿里云官网（https://www.aliyun.com/），登录账号后，在控制台页面中选择“产品与服务”下的“云服务器 ECS”。在 ECS 页面中，点击“立即购买”按钮，进入购买页面。注：除了阿里云还有腾讯云等公有云平台，完成学生认证后通常可享受优惠，如有需求可自行进一步了解。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/30fd97768f0b47817ab236fbac2dfda6615b5cd958662044947fae7c284f0d8c.jpg)


根据自身需求购买对应的项目。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/85c8474bddc63ce5edbd8a20fc9b804ec4be57a3a760a3d93b15907fba08bf57.jpg)


# 1.2 域名配置

域名就像是互联网上的“门牌号”或“地址簿”，它的功能是将复杂难记的IP地址（如192.168.1.1）转换为简单易懂的英文单词组合（如baidu.com），方便人们快速访问网站。它的核心作用是建立用户与网站服务器之间的桥梁，确保用户输入域名后能准确找到对应的网络资源。同时，域名还承载着品牌标识、专业形象和信任度，是企业或个人在数字世界中的重要身份象征。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/3af211cc482c8f0727a072253483755fa552b6df9ce2e2f3db28cf12f9a77e39.jpg)


# 1.2.1 域名注册

NameSilo是一家在国际上广受好评的域名注册商，其核心吸引力在于价格长期稳定透明、无隐藏费用，并且坚持为绝大多数域名免费提供终身WHOIS隐私保护，免去了用户额外的订阅成本与信息泄露的担忧。平台界面设计直观简洁，专注于提供域名注册、管理和转让等核心服务，操作体验流畅高效。凭借高性价比和可靠的客户支持，NameSilo成为了个人开发者、初创企业及注重隐私与预算的用户的首选注册商之一。

官方网站：https://www.namesilo.com

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/d4c88f08ac45fff2980bc0dacdb25af1771319501991f421fb40a21cd2074378.jpg)


# 用户注册

注册：https://www.namesilo.com/sign-up?redirect=%2F

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/68a686df7f51fcbe2a795475beb27cba2b109cf0b932224716993bbadeba3004.jpg)


# 域名挑选

选择不同的域名和后缀，会有不同的价格，作为实验使用，建议限制价格在3美元以下，如挑选的域名关键词价格都比较高的情况下，建议选择其它关键词再次搜索。

注意：本实验手册中，将以 0xse.cc 作为演示，学生在实验操作中，请替换为自己的域名。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/fd09814a268ac6cd65d5bdd1cf4607d46ecdafdc25cd36937be4e4cb015eb808.jpg)


# 域名支付

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/dbe4fff2bf2febd4232f77fb3c165027b66e809a44c6c1c0012f97f82bf8b004.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/7ed0008fa5914b2e6eb8169a3aaad130d1cdcba61027ad27f111991d69550194.jpg)


点击更多选项，在更多选项中选择支付宝支付。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/0c053101239721cc73938f660fb88f035eb19ef6ee48eaa652e5b4f25b8d14e8.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/8ac1fa64c77862b4b2950223c65e4c799d9aa2a8509161d763d6e22c99c6240d.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/22ee1db9c8b4fff790d755cf82ee48337795a72bd0267bbba4e361a26573d577.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/f4d2a71b4a9a4b8c9aba4cccca93fb3c186b0438010b27d45c4d4a7577733c83.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/3d65fb0e0d31dde0a9be0d5d0bc3e7b24c5e87cf0a83025b75d630d7a673f109.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/b26eca789fb58c9f20b0c57bd6d2f26c2f7ca6293db6a3168068694bdbe3b907.jpg)


# 支付宝 ALIPAY

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/d8eed90b55ac5695827972169c2084f512e3151deb11820699ae9971a41583bb.jpg)


交易付款成功，正在跳转至商户页面

您的货款已经打到卖家支付宝账户中，请您积极与卖家联系，确保交易顺利完成。

诚征英才 | 联系我们 | International Business

ICP证：合字B2-20190046

请记录以下信息：

<table><tr><td>域名</td><td>价格（美元）</td></tr><tr><td></td><td></td></tr></table>

# 1.2.2 域名解析配置

域名解析配置，本质上是为你的域名（如 example.com）在互联网“电话簿”（即 DNS 系统）中设置对应的联系地址。因为互联网上的所有服务器和设备最终都通过一串数字形式的 IP 地址（如 192.0.2.1）来互相定位和通信，而人类难以记忆这些数字。所以，我们需要将便于记忆的域名“翻译”成机器能识别的 IP

地址，这个过程就是域名解析。通过配置解析记录，当用户访问你的域名时，DNS系统就能准确地将他们引导至存放你网站内容的目标服务器，从而实现网站的访问。

# 域名管理

进入域名管理页面：https://www.namesilo.com/account_domains.php。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/356ee656297bafedf7bc870966bc9109569b35c8e293c244acc2911bd5e20d72.jpg)


初次配置域名信息需要进行邮箱验证。

https://www.namesilo.com/account.contacts_emailverification.php

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/ad2ce443729d54900a6a8b72887ffe82789968b9d2616040ca0b56abda94feca.jpg)


在注册时填写的邮箱中，点击连接并输入验证码。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/8e4b0f22bd1ef18e190b676059bab5427b96e27e8f20f5c41e3b93055a309ba2.jpg)


# IP地址解析

进入配置页面，将默认的IP替换为自己阿里云服务器的IP地址，本实验手册中将以8.217.110.77为例，学生在实验中请替换为自己分配到的IP，后续可参考1.1.7章节自行购买阿里云服务器进行绑定。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/8d19ac31c62739ea73325f5c262ac1c4644830ccfc36a823715206828573ebc9.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/1c26341373d1cfa261a18f708d4186d53f2cecee882ee88a8963ba5324cd4834.jpg)


提交配置后一般需要10分钟时间生效，有时可能需要更久。

# 域名配置生效检测

Windows上：

在 cmd 终端输入 nslookup 指令：如果能正确返回 IP 地址则说明上面的配置已经生效。

nslookup <自己注册的域名>

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/737b73629f736858fd7c1310588cd8ab0eba70dbd81a298014485b4d5ff930b5.jpg)


Linux上：

使用dig命令查询域名解析结果。

#dig  $<$  自己注册的域名>

```asm
root@datacon-wintersc:~# dig 0xse.cc   
;  $\ll >$  DiG 9.18.39-0ubuntu0.22.04.2-Ubuntu  $\ll >$  0xse.cc   
; global options:  $^+$  cmd   
; Got answer:   
;  $\rightarrow$  HEADER  $\ll -$  opcode: QUERY, status: NOERROR, id: 45437   
; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1   
; OPT PSEUDOSECTION:   
; EDNS: version: 0, flags::; udp: 65494   
; QUESTION SECTION:   
;0xse.cc. IN A   
; ANSWER SECTION:   
0xse.cc. 10 IN A 8.217.110.77
```

使用在线检测平台：

https:// toolbox.googleapps.com/apps/dig/#A/

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/ef0a0fbf20e7c5e5b9d448039ec36fa228cc5598197fb8350d61b11042855f51.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/8a67994af100da5008e3e7f51ba7b0c40e4f1b588af431509d50732ad2cb2a77.jpg)


# 1.2.3 DNS 缓存清理

清理DNS缓存是为了确保在测试域名解析时，能够获取到最新、最准确的DNS记录，而不是之前缓存的旧数据。当我们修改DNS配置（如更换服务器IP、调整CDN设置或修复解析问题）后，旧的DNS记录可能仍被浏览器、操作系统或网络设备缓存着，导致测试时看到的是过时的结果，无法验证更改是否真正生效。只有清理了这些多级缓存（包括浏览器缓存、系统缓存、路由器缓存等），才能强制系统重新向DNS服务器查询，从而获得真实的解析结果，确保测试的有效性和问题的准确排查。

# 缓存层次机构

<table><tr><td>浏览器 DNS 缓存</td><td>← 第一级（最快过期）</td></tr><tr><td>操作系统 DNS 缓存（系统级）</td><td>← 第二级</td></tr><tr><td>路由器/本地 DNS 服务器缓存</td><td>← 第三级（影响局域网）</td></tr><tr><td>ISP（网络提供商）DNS 缓存</td><td>← 第四级（TTL 较长）</td></tr><tr><td>公共 DNS 服务器缓存（如 8.8.8.8）</td><td>← 第五级</td></tr><tr><td>权威 DNS 服务器</td><td>← 最终来源</td></tr></table>

需要注意：浏览器应用程序（如 Chrome、Firefox）有自己的 DNS 缓存，单单清空系统缓存不影响它们，如果需要清空浏览器缓存，需要在浏览器设置中单独操作。

作为当前实验学生，我们只有权力改动本地浏览器缓存和操作系统缓存。虽然我们能在域名配置中修改具体的TTL（Time To Live，生存时间），但是有的平台会有最低门槛设定，如当前使用的Namesilo平台最小TTL为3600秒。以及如果设置极短的TTL时，中间DNS缓存系统（网络提供商、公共DNS服务器）可能不遵守设定的较小TTL值，而是替换为它们认为合理的最小值。

# Windows系统缓存清理

按 Win + R，输入 cmd，回车：

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/ea97b3e428816ce5bbfa5a2166b76c61bfc882c7b08a9418d6567333e42e514d.jpg)


使用以下命令清理系统DNS缓存记录，看到“成功刷新DNS解析缓存”提示

即完成。

ipconfig /flushdns

```txt
C:\>ipconfig /flushdnsWindowsIP配置已成功刷新DNS解析缓存。
```

# Linux系统缓存清理

使用以下命令清理系统DNS缓存记录，看到“Current Cache Size: 0”提示即完成。

resolventl flush-caches

# resolventl statistics

```yaml
root@datacon-winterc:~# resolvectl flush-caches root@datacon-winterc:~# resolvectl statistics DNSSEC supported by current servers: no Transactions Current Transactions: 0 Total Transactions: 62 Cache Current Cache Size: 0 Cache Hits: 0 Cache Misses: 62 DNSSEC Verdicts Secure: 0 Insecure: 0 Bogus: 0 Indeterminate: 0
```

# Chromium 内核浏览器

Chrome / Edge（Chromium 内核）通过地址栏

在地址栏输入并访问：chrome://net-internals/#dns

点击"Clear host cache"按钮

额外步骤：还需要清除 Socket 池

在地址栏输入：chrome://net-internals/#sockets

点击"Flush socket pools"

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/6d30612dcf529c24747fd784029ce35d8c4f6b235f1b881d40045208bb85e73c.jpg)


# Firefox 浏览器

Firefox 通过配置页面

在地址栏输入并访问：about:config

搜索 network.dnsCacheExpiration

双击将值临时改为 0 (清空后建议改回默认值 60)

或者搜索 network.dnsCacheEntries，设为 0。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/3614ee341f70223f003973b0620cf0fddcf8daccdc86e740eb994fc3888ba81f.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/a660dc58665ca1d181406794cc295cf2abf89eaa2b362d7dba81ba4aa10de38a.jpg)


# 三思而后行

更改高级配置的首选项可能会影响 Firefox 的性能和安全性。

当我尝试修改底层首选项时警示我

接受风险并继续

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/65b1c033f22b20e2f107c0ce93d541365136abe89a71a61ece4bc470b49db1ef.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/aa18e9593c41ef346ccdbe9edacf332e7ebaf7d9a171585867a79e27de896fb0.jpg)


# Safari (MacOS)

打开 Safari，点击菜单栏 Safari > 偏好设置

进入"高级"选项卡

勾选 "在菜单栏中显示开发菜单"

从菜单栏选择"开发”  $>$  "清空缓存"

# 1.3 网站搭建

将代码部署到公网上是为了构建一个可公开访问、持续运行的真实应用环境。在本地开发时，应用仅能在个人设备上运行和测试，功能与性能受本地资源限制，且无法模拟多用户并发访问、真实网络延迟及跨设备兼容性等实际场景。部署至阿里云服务器后，学生能够获得一个稳定的线上运行环境，便于通过任意网络和设备随时访问和测试项目功能，也为后续集成更复杂的数据处理、用户交互及扩展服务提供了必要的实践基础，使学习过程更贴近实际生产部署流程。

在前面的 Flask 学习课程已经详细的介绍了 Flask 的基础知识，本模块将会直接提供本课程实验的项目代码，学生需要部署到自己的阿里云服务器上方可进行后续课程内容（口令安全、AI 安全）。

项目地址：https://citee.com/xsecc/qhfz

# 1.3.1 服务器上部署项目代码

提供以下三种方法：Git克隆、VS Code上传、SCP远程传输。

# Git克隆 (推荐)

直接在服务器上使用Git克隆Github项目：

https://citee.com/xsecc/qhfz.git

```txt
root@datacon-wintersc:~# git clone https://gitee.com/xsecc/qhfz.git  
Cloning into 'qhfz' ...  
remote: Enumerating objects: 4, done.  
remote: Counting objects:  $100\%$  (4/4), done.  
remote: Compressing objects:  $100\%$  (4/4), done.  
remote: Total 4 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)  
Receiving objects:  $100\%$  (4/4), done.
```

# VS Code 上传

可先将项目下载到本地，然后通过在 VS Code 中拖拽方式，将项目代码上传到服务器指定位置。

访问：https://citee.com/xsecc/qhfz

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/b39bdd511325802fd151f9e301332405b1684c809f45aac407deed7135c535ab.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/55df71cfd6e86ad636a546d072cbe17387ef74d1c6e56693fcbb5df922b8aa18.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/e1f88cc18a0e30de29c4c6d7473178f0baa2194e3294f5bc9ba352980abd33dc.jpg)


# SCP远程传输

SCP（Secure Copy Protocol）是一个基于 SSH 的安全文件传输协议，用于在本地计算机和远程服务器之间，或者两个远程服务器之间安全地复制文件。

scp -r < folder_name> <username>@<server_ip>:<path>

输入密码：

<table><tr><td colspan="5">C:\&gt;scp -r QHFZ root@8.217.110.77:/root/ root@8.217.110.77&#x27;s password:</td></tr><tr><td>COMMIT(EditMSG</td><td>100%</td><td>147KB</td><td>28.7MB/s</td><td>00:00</td></tr><tr><td>config</td><td>100%</td><td>219</td><td>213.9KB/s</td><td>00:00</td></tr><tr><td>description</td><td>100%</td><td>73</td><td>71.3KB/s</td><td>00:00</td></tr><tr><td>HEAD</td><td>100%</td><td>21</td><td>20.5KB/s</td><td>00:00</td></tr><tr><td>applypatch msg.sample</td><td>100%</td><td>478</td><td>466.8KB/s</td><td>00:00</td></tr><tr><td>commit msg.sample</td><td>100%</td><td>896</td><td>875.1KB/s</td><td>00:00</td></tr><tr><td>fsmonitor-watchman.sample</td><td>100%</td><td>4726</td><td>4.5MB/s</td><td>00:00</td></tr><tr><td>post-update.sample</td><td>100%</td><td>189</td><td>184.6KB/s</td><td>00:00</td></tr><tr><td>pre-applypatch.sample</td><td>100%</td><td>424</td><td>0.4KB/s</td><td>00:00</td></tr><tr><td>pre-commit.sample</td><td>100%</td><td>1649</td><td>1.6MB/s</td><td>00:00</td></tr><tr><td>pre-merge-commit.sample</td><td>100%</td><td>416</td><td>486.2KB/s</td><td>00:00</td></tr><tr><td>pre-push.sample</td><td>100%</td><td>1374</td><td>1.3KB/s</td><td>00:00</td></tr><tr><td>pre-rebase.sample</td><td>100%</td><td>4898</td><td>4.8KB/s</td><td>00:00</td></tr><tr><td>pre-receive.sample</td><td>100%</td><td>544</td><td>0.5KB/s</td><td>00:00</td></tr><tr><td>prepare-commitmsg.sample</td><td>100%</td><td>1492</td><td>1.5KB/s</td><td>00:00</td></tr></table>

# 1.3.2 服务器安装 Flask

因为 Flask 本身是一个 Python 第三方库，而不是操作系统内置的可执行程序。当我们将开发好的 Flask 应用代码从本地计算机迁移到全新的服务器时，该服务器默认只有纯净的 Python 环境，并不包含项目所依赖的 Flask 库及其相关组件。如果在服务器上直接运行包含 import flask 的代码，Python 解释器会因为找不到这个模块而报错、无法启动应用。因此，必须通过 pip install flask 等命令在服务器上安装完全相同的 Flask 环境，才能为应用程序提供运行所需的依赖支持，这和我们在本地开发时第一步要安装 Flask 是同一个道理。

服务器已经部署python3和pip，可直接使用pip进行安装。

pip install flask

<table><tr><td>问题</td><td>输出</td><td>调试控制台</td><td>终端</td><td>端口</td></tr><tr><td colspan="5">root@datacon-winterc:\# pip install flask</td></tr><tr><td colspan="5">Looking in indexes: http://mirrors.aliyun.com/pypi/simple/DEPRECAIATION: The HTML index page being used (http://mirrors.aliyun.com/pypi/simple/flask/) is not a proper HTML 5 document. This is in violation of PEP 503 which requires these pages to be well-formed HTML 5 documents. Please reach out to the owners of this index page, and ask them to update this index page to a valid HTML 5 document. pip 22.2 will enforce this behaviour change. Discussion can be found at https://github.com/pypa/pip/issues/10825Collecting flask</td></tr><tr><td colspan="5">Downloading http://mirrors.aliyun.com/pypi/packages/ec/f9/7f9262c5695f4bd8023734af91bed2ff8209e8de6ead162f35d8c762fd/flask-3.1.2-py3-none-any.whl (103 kB)</td></tr><tr><td colspan="5">Requirement already satisfied: itsdangerous&gt;=2.2.0 in /usr/local/lib/python3.10/dist-packages (from flask) (2.2.0)</td></tr><tr><td colspan="5">Requirement already satisfied: click&gt;=8.1.3 in /usr/local/lib/python3.10/dist-packages (from flask) (8.3.1)</td></tr><tr><td colspan="5">Requirement already satisfied: blinker&gt;=1.9.0 in /usr/local/lib/python3.10/dist-packages (from flask) (1.9.0)</td></tr><tr><td colspan="5">Requirement already satisfied: werkzeug&gt;=3.1.0 in /usr/local/lib/python3.10/dist-packages (from flask) (3.1.4)</td></tr><tr><td colspan="5">Requirement already satisfied: markupsafe&gt;=2.1.1 in /usr/local/lib/python3.10/dist-packages (from flask) (3.0.3)</td></tr><tr><td colspan="5">Requirement already satisfied: jinja2&gt;=3.1.2 in /usr/local/lib/python3.10/dist-packages (from flask) (3.1.6)</td></tr><tr><td colspan="5">Installing collected packages: flask</td></tr><tr><td colspan="5">Successfully installed flask-3.1.2</td></tr><tr><td colspan="5">WARNING: Running pip as the &#x27;root&#x27; user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv</td></tr><tr><td colspan="5">root@datacon-winterc:\# []</td></tr></table>

# 1.3.3 启动网站

将开发完成的网站代码部署并运行在服务器上，使其成为一个可以通过网络访问的在线服务。其根本目的是将静态代码或本地应用转化为一个持续对外提供服务的公共端点，以便用户、测试人员或相关系统能够通过浏览器或API进行访问与交互。这不仅是为了完成功能验证和调试（常采用“临时运行”方式），更是为了实现服务的稳定、可靠与持久可用，从而支撑真实世界的业务需求。为此，在正式生产环境中，必须使用持久化运行方案（如Tmux会话守护、系统服务封装或容器化部署），确保服务器进程不会因终端断开而中断，以保障服务的连续性与可靠性。

# 临时运行

一般在调试和测试版中，为方便查看与验证，选择临时运行的方式，这种方式的问题在于一旦断开终端连接，运行的服务器也就会中断。

在前面案例中就是使用的临时运行，但要想持久对外提供服务还行额外操作。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/e01f1b4042bf630c7fd992039458e50b8431524296b6eaa8a210efc01361f132.jpg)


# 持久化运行

Tmux（Terminal Multiplexer）是一款终端复用软件，它允许你在一个终端窗口中创建、管理和切换多个持久化的虚拟终端会话。即使关闭 SSH 连接或终端窗口，会话仍在后台运行，随时可重新接入。它的核心功能包括分屏（将窗口划分为多个窗格）、会话管理（保存工作环境）和窗口标签（像浏览器标签页一样管理多个终端任务），特别适合远程服务器开发、运维和需要长时间运行任务的后台场景。

Tmux 常见使用命令如下，更多用法请自行了解。

tmux new -s <sessionname> 创建名为 sessionname（可自定义）的会话

tmux ls 显示会话列表

tmux a 连接上一个会话

tmux a -t <sessionname> 连接指定会话

tmux rename-ts1s2 重命名会话s1为s2

tmux kill-session 关闭上次打开的会话

tmux kill-session -t s1 关闭会话s1

tmux kill-session -a -t s1 关闭除s1外的所有会话

tmux kill-server 关闭所有会话

常用快捷键：

Ctrl+b d 离开当前会话（最常用，相当于最小化）

Ctrl+b x 删除当前会话（最常用，相当于关闭）

Ctrl+b s 列出会话，可进行切换

Ctrl+ba-t number 其中number是tmuxls获取的序列号从0开始使用举例：

前期已将项目上传至服务器的 /root/QHFZ 路径下，接下来在该路径中创建 Tmux 新会话，并设定会话名称，假设新的会话名称叫“QHFZ”：

tmux new -s QHFZ

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/2e2bd7349f06bf27c67ca4fb99dad462024e87ae5ec966a48b8e369d09fbe2bb.jpg)


在该会话中运行 python3 app.py

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/085116520296c2d695fa5b0778d5568aa15b1b187b924c927342b3a98d5b86ff.jpg)


退出当前会话时，快捷键：先按 Ctrl+b，后按 d

为增加 Tmux 演示效果，可额外再创建一个叫“TEST”的会话。

查看当前系统运行的 Tmux 会话列表:

tmux ls

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/59f90c8d0073694bcbef33e3b3864b764fd41ecf15a5309161e8597fba330b62.jpg)


可以看到当前系统中存在两个刚才创建的 Tmux 会话：QHFZ 和 TEST。下面以终止 QHFZ 会话为例，演示如何销毁创建的 Tmux 会话。

tmux kill-session -t TEST

root@datacon-winterc:~/QHFZ# tmux kill-session -t TEST  
root@datacon-winterc:~/QHFZ# tmux ls  
QHFZ: 1 windows (created Thu Jan 15 14:07:49 2026)

# 1.3.4 Nginx 配置

Nginx 是一款高性能的 Web 服务器和反向代理服务器软件, 其核心作用是高效、稳定地处理网络访问请求。它可以直接托管网站文件（如 HTML、图片），响应用户的浏览器访问；更重要的是，它常作为“智能交通调度员”，充当反向代理，接收用户请求后，将其转发给后端的多个应用服务器（如 Java、Python 程序），并将结果返回给用户，从而实现负载均衡、提升并发处理能力与系统安全性。同时，Nginx 还能提供缓存加速、SSL/TLS 加密（HTTPS）等关键功能，是现代网络架构中至关重要的基础组件。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/4a64a8d385c1c8762e04d1ccdf520677f2a11a00bbc85317fd97e211815c4466.jpg)


# Nginx 安装

查看当前可安装nginx版本

apt list -anginx

Nginx 安装

apt installnginx -y

查看nginx安装版本

nginx -V

验证ssl模块

```batch
root@datacon-winterc:~#nginx -V 2>&1 | grep ssl
configure arguments: --with-cc-opt='--g -02 -ffile-prefix-map=/build/nginx-aSXXE0/nginx-1.18.0=. -flto=auto -ffat-lto-objects -flto=auto -ffat-lto-objects -fstack-protector-strong -Wformat -Werror=format-security -fPIC -Wdate-time -D_FORTIFY_SOURCE=2' --with-ld-opt='--wl, -Bsymbolic-functions -flto=auto -ffat-lto-objects -flto=auto -wl, -z,relo -wl, -z,now -fPIC' --prefix=/usr/share/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/lgog/nginx/access.log --error-log-path=/var/log/nginx/errortolog --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid --modules-path=/usr/lib/nginx/modules --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-compat --with-debug --with-pcre-jit --with-http_SSLmodule --with-http_stub_statusModule --with-http_realipModule --with-http_auth_requestModule --with-http_v2module --with-http的日v module --with-httpSlice module --with-threads --add-dynamic-module=/build/nginx-aSXXE0/nginx-1.18.0/debian/modules/http-geoip2 --with-http_additionModule --with-http_gunzipModule --with-http_gzipstatic module --with-http_sub_module
```

# Nginx 配置验证与生效

验证 Nginx 是否存在配置方面的语法错误。

```txt
#nginx -t
```

```txt
root@datacon-winterc:\~#nginx-t  
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok  
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

重新加载 Nginx 配置项。

```txt
nginx -s reload
```

```batch
root@datacon-wintersc:\~#nginx-s reload root@datacon-wintersc:\~#
```

如果加载nginx配置文件失败，可尝试重启Nginx服务

```txt
systemctl restartnginx
```

```txt
root@datacon-winters:~# systemctl restart nginx  
root@datacon-winters:~#
```

# Nginx 默认页面

Nginx 默认使用 80 端口，若 80 端口已被占用则会启动失败，成功启动后，

直接访问就能看到 Nginx 的默认页面。

# Welcome to nginx!

If you see this page, thenginx web server is successfully installed and working. Further configuration is required.

For online documentation and support please refer to nginx.org.

Commercial support is available at nginx.com.

Thank you for using nginx.

# 1.3.5 HTTPS 配置

HTTPS 是在 HTTP 协议基础上，通过加入 SSL/TLS 加密层来实现安全通信的网络协议。它的核心作用是在客户端（如浏览器）和服务器之间建立一个加密通道，对传输的数据进行加密和完整性保护，有效防止窃听、篡改和中间人攻击；同时通过数字证书进行身份认证，确保用户访问的是真实、可信的服务器（而非钓鱼网站）。这使得 HTTPS 成为当今网站保障用户隐私和数据安全（如登录凭证、支付信息）的基础性安全标准，也是浏览器标识网站可信度的关键指标（地址栏显示锁形图标）。

# Certbot 安装

Certbot 是一个免费、开源的自动化工具，主要作用是为网站自动获取、部署和续期 Let's Encrypt 颁发的 SSL/TLS 证书，从而将网站的 HTTP 连接升级为加密的 HTTPS 连接，保障数据传输安全。它通过简化的命令行交互，自动完成域名验证（如 DNS 或 HTTP 挑战）、证书申请、Web 服务器（如 Nginx、Apache）配置更新等复杂流程，并内置定时任务自动续期证书，彻底解决了传统 SSL 证书昂贵、手动操作繁琐和易过期的问题，是推行全站 HTTPS 的标配工具。

在安装 Certbot 前需要更新 apt，避免本地 apt 包中没有 Certbot。

apt update

安装certbot工具。

apt install certbot -y

通过查看安装版本确认certbot是否安装成功。

certbot --version

```batch
root@datacon-winterc:\~# certbot --version certbot 2.9.0
```

# SSL/TLS 证书申请

方式一：

手动模式申请证书，注意，本书中出现的0xse.cc域名为演示域名，学生在实际操作时需要更换为自己购买的域名。

#

```txt
root@datacon-winterc:/# certbot certainly --manual --preferred-challenges=dns -d "www.0xse.cc" --server https://acme-v02 api.letsencrypt .org/directory   
Saving debug log to /var/Log/letsencrypt/letsencrypt.log   
Requesting a certificate for www.0xse.cc   
Please deploy a DNS TXT record under the name: acme-challenge. www.0xse.cc. with the following value: ZDQ2aL1lOXXu9NTULvh2wyawC_CBWDh_IDjpgNmRY-k Before continuing, verify the TXT record has been deployed. Depending on the DNS provider, this may take some time, from a few seconds to multiple minutes. You can check if it has finished deploying with aid of online tools, such as the Google Admin Toolbox: https://toolbox.googleapps.com/apps/diq/#TXT/ acme-challenge. www.0xse.cc. Look for one or more bolded line(s) below the line';ANSWER'. It should show the value(s) you've just added.. Press Enter to Continue 注意：此处先不要按回车健！！！
```

注意!!!：当看到出现挑战码时先不要按回车键。此时需要在域名管理平台发布相应的内容。

从这个提示信息中能看得出来，需要将_acme-challenge.www.0xse.cc的DNS TXT记录配置为：ZDQ2aL1IOXXu9NTULvh2wayC_BWDh_IDjpgNmRY-K

此时需要回到域名配置页面

https://www.namesilo.com/account_domains.php。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/42c48eb341d4466b6cb016a5c1e554960e4329d705ac1bdbc88dd3312d7ed3a7.jpg)


根据提示要求，新增DNS记录，类型选择TXT，名称填写_acme-challenge.www,文本内容写入指定值：

ZDQ2aL1IOXXu9NTULvh2wayC_BWDh_IDjpgNmRY-K

点击提交。注意，学生在操作这一步时需根据自己的实际值进行填写。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/7e20787a79e4e1cbf9219836e88e3f91578e55c275d83f4d005c3cba6400865c.jpg)


提交发布后，还需要持续等待约10分钟左右使配置记录能在全球生效，等待过程中，可在本机进行测试。

通过以下3种方式查看_acme-challenge是否更新

nslookup_type=txt_acme-challenge.www.0xse.cc

dig acme-challenge.www.0xse.cc TXT

https:// toolbox.googleapps.com/apps/dig/#TXT/_acme-challenge.www.0xse.c

C

注意：www.0xse.cc为示例域名，实际操作申请使用自己申请的域名。

```batch
C:\>nslookup -type=txt _acme-challenge.www.0xse.cc
```

服务器：Unknown

```txt
Address: 2402:f000:1:801::8:28
```

非权威应答：

```txt
_acme-challenge.www.0xse.cc text = "ZDQ2aL1lOXXu9NTULvh2wyawC_CBWDh_IDjpgNmRY-k"
```

```batch
$\%$  dig_acme-challenge.www.0xse.cc TXT
```

```html
; <>>> DiG 9.10.6 <>>> _acme-challenge.www.0xse.cc TXT
```

```txt
; global options: +cmd
```

```txt
Got answer:
```

```txt
; -->>HEADER<<-- opcode: QUERY, status: NOERROR, id: 39097
```

```txt
;；flags:qr rd ra;QUERY:1,ANSWER:1,AUTHORITY:0，ADDITIONAL:1
```

```txt
; OPT PSEUDOSECTION:
```

```txt
; EDNS: version: 0, flags::; udp: 1232
```

```txt
; ; QUESTION SECTION:
```

```batch
;acme-challenge.www.0xse.cc. IN TXT
```

```txt
; ; ANSWER SECTION:
```

```txt
_acme-challenge.www.0xse.cc.3600 IN
```

```txt
"ZDQ2aL110XXu9NTULvh2wyawC_CBWDh_IDjpgNmRY-k"
```

# Google管理员工具箱

帮助

名称

Lacme-challenge. www.0xse.cc

A

AAAA

ANY

CAA

CNAME

DNSKEY

DS

NS

P

so

SRV

TL

TS

TXT

TXT

TTL:

1 hour

VALUE:

"ZDQ2aL10OXu9NTULvh2vyayC_CBWDb_IDjpgNkR-k"

本过程中，可能受到本地DNS缓存记录影响，导致刷新后未获得最新记录，可参考1.2.3 DNS缓存清理进行清理缓存。

当检测到 TXT 记录生效后方可按回车按钮继续完成证书申请，此过程中一

旦申请失败可申请其他子域名。因为即使再次申请相同域名的证书，每次的挑战码都不一致，重新提交挑战码后，旧的挑战码短期内依旧未在互联网中被彻底更新，需要等待很久的时间才是彻底更新完。

```txt
root@datacon-winterc:/# certbot certonly --manual --preferred-challenges  $\equiv$  dns -d "www.0xse.cc" --server https://acme-v02.api.letsencrypt .org/directory   
Saving debug log to /var/log/letsencrypt/letsencrypt.log   
Requesting a certificate for www.0xse.cc   
Please deploy a DNS TXT record under the name: acme-challenge.www.0xse.cc.   
with the following value: ZDQ2aL1IOXXu9NTULvh2wyawC_CBWd_IDjpgNmRY-k   
Before continuing, verify the TXT record has been deployed. Depending on the DNS provider, this may take some time, from a few seconds to multiple minutes. You can check if it has finished deploying with aid of online tools, such as the Google Admin Toolbox: https://toolbox.googleapps.com/apps/dig/#TXT/ acme-challenge. www.0xse.cc. Look for one or more bolded line(s) below the line';ANSWER'. It should show the value(s) you've just added..   
Press Enter to Continue 当验证TXT记录生效后继续按回车健.   
Successfully received certificate. Certificate is saved at:/etc/letsencrypt/live/www.0xse.cc/fullchain.pem Key is saved at: /etc/letsencrypt/live/www.0xse.cc/privkey.pem This certificate expires on 2026-03-24. These files will be updated when the certificate renews.   
NEXT STEPS: - This certificate will not be renewed automatically. Autorenewal of --manual certificates requires the use of an authentication hook s script (-manual-auth-hook) but one was not provided. To renew this certificate, repeat this same certbot command before the certificate 's expiry date.
```

此时可以看到成功申请到的证书保存地址为：/etc/letsencrypt/live/<申请域名>文件夹下，其中privkey.pem是私钥文件，fullchain.pem是完整证书链文件，它包含了公钥，但不仅仅是公钥。

注：如果方式一短期难以完成，可通过方式二尝试。

方式二：

Standalone 模式是 Certbot 的一种工作模式，它会临时启动一个内置的 Web 服务器来处理 Let's Encrypt 的验证挑战。

工作原理：

Certbot 自动启动一个临时的 Web 服务器，监听 80 端口（HTTP-01 挑战）或 443 端口（TLS-ALPN-01 挑战），专门用于响应 Let's Encrypt 的验证请求。自动处理挑战文件，在内存中创建验证文件，Let's Encrypt 访问 http://你的域名:80/.well-known/acme-challenge/xxx，Certbot 的临时服务器直接响应，验证完成后自动关闭。获取证书后，临时服务器自动停止，不会影响你原有的 Web 服务器。

这里以oa.0xse.cc为例，演示方式二。注意：oa.0xse.cc为示例域名，实际操作中请使用自己申请的域名。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/ec4bafe995d7d3b434ae176c193a59d0145e4c752508032824e470eaae1ebef5.jpg)


由于 Standalone 模式会占用本地 80 端口和已安装的 Nginx 会产生冲突。

先停止 Nginx，解除本地 80 端口的占用。

systemctl stopnginx

certbot certainly --standalone -d oa.0xse.cc

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/7d900f110571235e4aa8f91037caf40181e1694aa0bd2bcd2aab08d4509765fb.jpg)


注意：申请证书完毕后记得重新启动 Nginx。

systemctl startnginx

# 流量转发与代理

编辑 Nginx 配置文件，先实现将访问本地 80 端口的 HTTP 流量转发到 443 端口的 HTTPS 上，并使用代理将流量传输到真正的 Web 服务器（Flask 系统的 8080 端口）上。

这里推荐使用 Nano 编辑器，常用的快捷键有：

Ctrl + S 保存

Ctrl + K 删除整行

Ctrl + X 退出

使用 Nano 编辑器，按键盘方向键定位光标，通过键盘输入内容或通过鼠标右键粘贴。

注意：www.0xse.cc为示例域名，实际操作申请使用自己申请的域名。


nano /etc/nginx/sites-available/default


```txt
server {
listen 80;
listen [::]:80;
server_name www.0xse.cc;
# HTTP 到 HTTPS 重定向
location / {
return 301 https://www.0xse.cc$request Uri;
}
}
server {
listen 443 ssl;
listen [::]:443 ssl;
server_name www.0xse.cc;
# SSL 配置
ssl_certicate /etc/letsencrypt/live/www.0xse.cc/fullchain.pem;
ssl_certicate_key /etc/letsencrypt/live/www.0xse.cc/privkey.pem;
# SSL 协议和加密套件（安全推荐）
ssl_protocols TLSv1.2 TLSv1.3;
ssl_ciphers HIGH!aNULL:?MD5;
# 其他配置保持不变
root /var/www/html;
index index.html index.htm index.nginx-debian.html;
# 反向代理配置
location / {
# 实验课程中的 Flask 是运行在 8080 端口
proxy_pass http://127.0.0.1:8080;
```

```txt
}
```

验证 Nginx 配置语法无误后，重新加载 Nginx 配置项。

```txt
root@datacon-wintersc:~#nginx -t  
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok  
nginx: configuration file /etc/nginx/nginx.conf test is successful  
root@datacon-wintersc:~#nginx -s reload
```

# HTTPS证书验证

在浏览器上访问自己申请的域名，本手册中以 www.0xse.cc 为例。

以下是Chrom浏览器访问实验网站示意图：

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/627bf73456d4dde550f6b5cf758b1c7c5cff17c60bac1af5a960e1c42330af69.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/f2b531bd93de66f0e4606b940115c60b60a797442f4301a3ac54deb5febf0606.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/6b0bde8e39bdf094990e68516016400520c0ecfadecc9cc3f873f5e172b68bb6.jpg)


以下是 Edge 浏览器访问实验网站示意图：

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/716e17ae3ebbc233b1933175f8e9dbef3ff18d5434ec2ef0450f71b9c4c89f70.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/ca769cf9b7544544b1c4dd947c4eabeec483d556f2470db10d97d3565d337200.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/2b289fd0e7da8b32a25845166a46d8bf130fc024ed52cffcd9892e3953fe4035.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/8a5a5117c72da3231b8c30dac27165539b2925c8a47b772a5fd205a78aa7fed7.jpg)


其他类型浏览器查看证书也是点击地址前面的安全标志符号，过程可能略有不同。

# 1.3.6 博客网站搭建（扩展内容）

Hugo 是一个用 Go 语言编写的现代化静态网站生成器，它能将简洁的 Markdown 文本文件与模板主题相结合，闪电般地生成完整的静态 HTML 网站。它无需数据库或复杂的运行环境，让你专注于内容创作，只需简单编写 .md 文档，Hugo 便能自动解析结构、应用布局样式，并输出一套可部署于任何 Web 服务器的轻量级静态文件，是构建博客、文档站或企业官网的高效利器。

# Hugo 安装

官网地址：https://gohugo.io/

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/5c3b742eab6597acb9de07aa95463e73ba2b2a33b46e48aa63a0be7e46f5feb0.jpg)


在GibHub上下载hugo可执行文件。

访问：https://github.com/gohugoio/hugo

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/f889ee7d288b9ff297c8cb48ed592eeaa2e9ba6e060269eb0b4a02d58f8fe881.jpg)


# 注意!!!,这里选择扩展版（带extended），普通版无法使用第三方主题代码。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/91ac4b1be2981a360eed6b4ded32ddc6a0ecd6d87cda2c146e1f4c5fe70767a4.jpg)


Releases / v0.154.5

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/c93f2596ecb152b8559044e59f09d719e05cd4c5af2990da89ca84c4f3bbe9bf.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/80f0c57638b3df2e0e8d239b5476c2c615dd002b3898374122044246873986ed.jpg)


解压该 zip 压缩包文件，这里以

C:\hugoextended_0.154.3_windows-amd64\为例。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/e949403d5cf6bccd8956464419032bcf35bdc78d22f8209e897d4384da2b53a8.jpg)


为在系统任何路径中都能使用到hugo.exe，这里将hugo.exe添加到电脑的系统环境变量中。按win+R键输入sysdm.cpl打开系统属性。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/e5f8739747d0a777c131ed6bd1d2ea42cc6bb81f3d5076319a6d0a0b2816bb01.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/8dfb99ad92bcfc6ba4c3fa8acf499f84f953d1690883cf7b0a4ecfca7e4eaf5e.jpg)


选择编辑 系统变量 中的 Path。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/fb7db8d0cd935713d8757f73cfeb3b2be3fac07f7fd0a7c7600a255d732eafad.jpg)


添加hugo.exe所在的文件路径：

C:\hugoextended_0.154.3_windows-amd64\

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/cf676d5f6350d5d9ecb6d3cf5a04890a7e42b7f269717eabc07ebd3636b4c724.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/f707bd6cd2b92ca95ca1bbed67602cddb4c92d991ae6923a3ad321aa02682e29.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/3865c42d61b41c9b42b28faf57ccf159116bb0bae2504ae3a77d966c6a5ad107.jpg)


# 创建网站

在CMD命令行中，进入要放置网站的目录，本书以C:\hugoextended_0.154.3_windows-amd64\为例，学生请根据自身放置Hugo路径为主，然后运行下面命令创建博客项目文件夹：

hugo.exe new site <博客名称>

这里以 myblog 作为博客名为例，学生实际操作申请根据自身情况决定。

```txt
C:\Windows\System32\cmd.exe +  
Microsoft Windows [版本 10.0.26200.7462]  
(c) Microsoft Corporation. 保留所有权利。  
C:\hugoextended_0.154.3_windows-amd64>hugo.exe new site myblog  
Congratulations! Your new Hugo site was created in C:\hugoextended_0.154.3_windows-amd64\myblog.  
Just a few more steps...  
1. Change the current directory to C:\hugoextended_0.154.3_windows-amd64\myblog.  
2. Create or install a theme:  
- Create a new theme with the command "hugo new theme <THEMENAME>"  
- Or, install a theme from https://themes.gohugo.io/  
3. Edit Hugo.toml, setting the "theme" property to the theme name.  
4. Create new content with the command "hugo new content <SECTIONNAME>\<FILENAME>.<FORMAT)."  
5. Start the embedded web server with the command "hugo server --buildDrafts".  
See documentation at https://hugo.oio/.
```

创建后能看到出现 myblog 的文件夹。

```txt
此电脑  $\succ$  系统(C)  $\succ$  hugo_EXTENDED_0.154.3_windows-amd64  $\succ$  排序查看…名称 修改日期 类型myblog 2026/1/9 13:16 文件夹hugo.exe 2026/1/9 13:16 应用程序LICENSE 2026/1/9 13:16 文件README.md 2026/1/9 13:16 Markdown源文件
```

进入 myblog 文件夹，可以看到基本的项目框架结构如下：

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/7ac6f4739cbc76c876e1b287bb7c91a202b8f00d18092dd49d1309905ea3f344.jpg)


hugo.toml 是网站的主配置文件，定义了站点标题、主题、URL 等基本设置；archetypes 存放内容模板，用于快速生成具有预设 Front Matter 的 Markdown 文件；assets 包含 CSS、JavaScript 等需要处理的资源文件；content 是网站的核心，所有 Markdown 格式的文章和页面都存储在这里；data 存放 YAML、JSON 或 TOML 格式的配置文件，用于存储全局数据；i18n 存放国际化翻译文件，支持多语言网站；layouts 包含 HTML 模板文件，控制页面的结构和布局；static 存放直接复制到最终站点的静态文件，如图片、字体和不需要处理的文件；themes 则存放网站主题，包含预设的布局和样式，用户可以选择或自定义主题来改变网站外观。

# 添加主题

以当前文件路径 C:\hugoextended_0.154.3_windows-amd64\ 为例，初始化Git仓库。

git init

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/dd72653b8021c9250561dd4ebca67aa6bfd7d486225f20a251ad55ffa9ee3f88.jpg)


也可使用绝对路径初始化Git仓库，Hugo安装在D盘中。

以D:\hugoextended_0.154.5_windows-amd64为例进行初始化Git仓库。

git init "D:\hugoextended_0.154.5_windows-amd64"

# 安装主题

# 方式1：远程命令安装

这里以 ananke 主题为例，学生可自行选择其他主题，进入刚才创建的 myblog 文件夹中执行下面命令：

#

git

submodule

add

https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke

```txt
C:\hugoextended_0.154.3_windows-amd64\myblog>git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke Cloning into'C:/hugoextended_0.154.3_windows-amd64/myblog/themes/ananke'...   
remote:Enumerating objects:4106,done.   
remote:Counting objects:  $100\%$  (63/63),done.   
remote:Compressing objects:  $100\%$  (39/39),done.   
remote:Total 4106 (delta 48),reused 24 (delta 24),pack-reused 4043 (from 2)   
Receiving objects:  $100\%$  (4106/4106),6.20MiB|2.53MiB/s,done.   
Resolving deltas:  $100\%$  (1992/1992),done.   
warning: in the working copy of'.gitmodules', LF will be replaced by CRLF the next time Git touches it
```

当然也可在Gitee中尝试获取，在Gitee官网中搜索：https://so.gitee.com/

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/dfe6daefab99e83ff7b9af69438fe4a4d4a7389a7507abdb2005978633c3f3ae.jpg)


# 方式2：手动安装

使用浏览器访问：

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/671aa1b8ad56271ac4348f550b887bfa4fa7f077bdaff07dca31a8c35dd30834.jpg)


找到最新的版本（如 v2.12.1），点击 Source code (zip) 或类似的压缩包链接进行下载。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/83f2002836082be2e0944d9940075d004cbca8ca703fd18f932daf33289833d0.jpg)


在 myblog\themes\ 中，新建名为 ananke 的文件夹，将解压后的文件夹里的所有内容（通常是 archetypes, layouts, README.md 等），都复制到刚刚创建的 myblog\themes\ananke\ 文件夹中。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/c82a539f0ad1b209915f29e058565fb9e8322d96d91dcac893990523727cdc10.jpg)


完成后，myblog 目录结构应该大致如下：

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/f0cb1b89de2699c7d5217313080b1772d3648301821bc21ae80a0faf6ee92cf9.jpg)


# 配置与试运行

打开网站根目录下的hugo.toml文件，添加启用的主题配置，以及要部署网站的域名和路径：

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/2239a0bcd5ae9ad253f33a5a6134eb8f3b067019a81379f799d434f2aeebf830.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/a65708b0b47bd70bdba3f7439802ae439facd84be8102796f7af985553d0a031.jpg)


最后，在 myblog 目录中启动本地服务：

hugo.exe server

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/27254c55d76baeb13baa6d37501a0fbad5e8bbadd7a5e0a00eeeb1eb31464f28.jpg)


当只配置hugo.toml时，Hugo会使用主题自带的演示效果,如下图所示：

http://localhost:1313/myblog/

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/000478f440fe7bc19fcea98ae2f0eb8cab92595b5c44a39099cfaec9ef1bc18d.jpg)


# Hugo 目录结构

以接下来使用到的案例为例，Hugo 的目录结构主要由以下组成。

```txt
myblog/
```

hugo.toml

配置文件

— themes/

# 主题目录

static/

# 静态文件目录

images/

# 图片目录

hugo-logog.png

# 图片文件

content/

内容目录

— posts/

# 文章目录

Hugo快速入门.md

内容：categories: ["网站搭建"]

密 码安全基础.md

内容：categories: ["口令安全"]

ai安全入门.md

内容：categories: ["AI安全"]

categories/

分类目录

index.md

# 分类文件！

tags/

标签目录

index.md

标签文件！

hugo.toml 是 Hugo 网站的全局配置文件，它启用和配置网站的各类功能。通过在文件中设置[taxonomies] category = "categories"来激活分类系统，定义网站的基础参数如标题、主题、URL 结构等，并控制所有页面的生成规则和显示方式。

categories是分类系统的展示层，具体表现为content/categories/_index.md文件及其自动生成的页面。它负责创建分类导航界面，自动聚合所有标记了分类的文章，为每个分类生成独立的列表页面，并提供用户浏览分类内容的入口路径。

tags 是标签系统的展示层, 具体表现为 content-tags/_index.md 文件及其自动生成的页面。它负责创建标签导航界面, 自动聚合所有标记了标签的文章, 为每个标签生成独立的列表页面, 并提供用户通过关键词浏览内容的入口路径。

<文章>.md 是具体的内容文档，位于 content/posts/ 目录下。它在文档的 YAML 头部通过 categories: ["分类名"]字段声明所属分类，当 Hugo 生成网站时，系统会根据这个声明自动将文章归入对应的分类页面中，同时生成独立的文章浏览页面。

可以把这四者比作图书馆管理系统：hugo.toml 是图书馆馆长，他既规定图书必须按学科分类上架（categories），也要求为每本书建立详细的关键词索引卡（tags）；categories 是图书分类目录牌，展示“计算机类”“文学类”等固定分类标识；tags 则是贴在每本书上的关键词索引卡，记录“Python”“悬疑”“2023 出版”等具体主题与属性；而文章.md 就是一本具体图书，它被放在“计算机类”书架上（categories），同时书内附有“Python”和“入门教程”等多张索引卡（tags）。这样，读者既可以通过分类目录牌查找一个大类的图书，也能通过关键词索引卡快速找到所有关联主题的书籍，无论它们属于哪个主分类。

# 创建博客

接下来使用Hugo工具搭建一个结构清晰、目的明确、专注于学习笔记的博客。

第一步：规划内容结构（分类）

我们来规划知识体系。假如，网站内容分为三个页面：Hugo 快速入门、密码安全基础、AI 安全入门。

首先，通过hugo.toml设置整体样式，设置网页标题、主题、菜单栏等。修改hugo.toml为：

```txt
baseURL = 'https://www.0xse.cc/myblog/'  
languageCode = 'zh-cn'  
title = '我的博客'  
theme = 'ananke'
```


添加分类配置


```txt
[taxonomies] category  $=$  "categories" #重要！ tag  $=$  "tags" #重要！
```


菜单配置（可选，但建议添加）


```toml
[menu]  
[[menu.main]]  
name = "首页"  
url = "/"  
weight = 1
```

```toml
[[menu.main]]  
name = "分类"  
url = "/categories/"  
weight = 2
```

```toml
[[menu.main]]  
name = "标签"  
url = "/tags/"  
weight = 3
```


# 分页设置


```txt
[pagination] pageSize  $= 10$
```

浏览器访问博客网站，可以看到通过配置hugo.toml，已经改变了默认页面的内容。

http://localhost:1313/myblog/

# 我的博客

我的博客2026

其次，为了对文章进行统一管理和快速定位，继续增加分类和标签管理。

在 myblog/content/ 目录下，创建核心分类文件。

在 myblog 目录下执行：

hugo.exe new content categories/_index.md

```batch
C:\hugoextended_0.154.3_windows-amd64\myblog>hugo.exe new content categories/_index.md  
Content "C:\hugoextended_0.154.3_windows-amd64\myblog\content\categories\index.md" created
```

编辑content/categories/_index.md

```txt
---  
title: "文章分类"  
type: "categories"  
---
```

这里是所有文章的分类列表。点击分类名称查看该分类下的所有文章。

浏览器访问：http://localhost:1313/myblog/categories/，因为还没创建具体的文章，此时还不会出现归类的文章。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/0044569a8e693a3be193d80cf29006b20c9aec3fc81b98a801f5c98435c54404.jpg)


编辑content-tags/_index.md

--- title: " 文章标签"

type:"tags"

---

这里是所有文章的标签列表。点击标签查看该标签下的所有文章。

浏览器访问：http://localhost:1313/myblog-tags/，因为还没创建具体的文章，此时也不会出现归类的标签。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/4bc6564d0df9557ccfd761e93d7a9ef9f763dff29ac531241a8490040eefd8ba.jpg)


第二步：创建博客文章

文章1：Hugo快速入门

hugo.exe new content posts/Hugo 快速入门.md

```batch
C:\hugoextended_0.154.3_windows-amd64\myblog>hugo.exe new content posts/Hugo快速入门.md  
Content "C:\hugoextended_0.154.3_windows-amd64\myblog\rcontent\rposts\Hugo快速入门.md" created
```

编辑网站搭建相关文章，注意文章1里面有个配置图片的案例，需要学生在static文件夹中建立一个images文件夹，然后在images文件夹中保存一张名为hugo-logo.png的图片。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/aa9742176af16427f90f92ad3146b4e024d225860ab436a45d6969f40dfb691e.jpg)



文章1：Hugo入门教程 (content/posts/Hugo快速入门.md)


```txt
title:"Hugo静态网站快速入门指南"  
date:2026-01-10  
categories:["网站搭建"]  
tags:"hugo","静态网站","教程","入门"]  
description:"从零开始学习使用Hugo搭建个人博客"  
featured_image:"/images/hugo-logo.png"  
draft:false
```

# ## 一、Hugo简介

Hugo 是一个用 Go 语言编写的静态网站生成器，以其**速度快**和**简单易用**而闻名。

# 主要特点

- **极速生成**：生成上千页面只需几秒钟

- **Markdown 支持**: 使用简单的 Markdown 语法写作

- **主题丰富**：大量开源主题可供选择

- **配置简单**：单个配置文件管理所有设置

# ## 二、安装 Hugo

Windows系统

1. 访问 Hugo GitHub Releases 页面

2. 下载 `hugoextended_xxx_windows-amd64.zip`

3. 解压得到 `hugo.exe` 文件

4. 放到项目目录或添加到系统 PATH

验证安装

./hugo.exe version

显示：hugo v0.154.3+extended

# 文章2：密码安全基础

hugo.exe new content posts/密码安全基础.md

```batch
C:\hugoextended_0.154.3_windows-amd64\myblog>hugo.exe new content posts/密码安全基础.md  
Content "C:\hugoextended_0.154.3_windows-amd64\myblog\rcontent\rposts\r密码安全基础.md" created
```

- -

title:"密码安全基础"

date: 2026-01-10

categories: ["口令安全"]

tags: ["密码学", "安全", "加密"]

description:"了解密码学基础和个人密码管理"

draft: false

---

# ## 一、密码安全重要性

密码是保护数字身份的第一道防线。弱密码会导致隐私泄露和财产损失。

# ## 二、密码学基础

1. 哈希函数

- 单向加密，不可逆

- 相同输入永远输出相同结果

- 常见算法：SHA-256、bcrypt

# 2. 对称加密

- 同一个密钥加密和解密

- 常用算法：AES

- 适用于文件加密

3. 非对称加密

- 公钥加密，私钥解密

- 常用算法：RSA、ECC

- 用于 SSL 证书、数字签名

# ## 三、密码存储安全

##禁止的做法

- 明文存储密码

- 使用MD5等弱哈希

- 可逆加密存储

# 正确做法

-加盐哈希存储

- 使用 bcrypt、Argon2 等强算法

- 每个用户不同盐值

# 四、个人密码管理

强密码规则

- 至少12位字符

- 混合大小写、数字、符号

- 不要用常见词汇

# 密码工具

- 密码管理器：Bitwarden、1Password

- 启用双因素认证

- 定期更换重要密码

# 文章3：AI安全入门

hugo.exe new content posts/AI安全入门.md

```batch
C:\hugoextended_0.154.3_windows-amd64\myblog>hugo.exe new content posts/AI安全入门指南.md  
Content "C:\hugoextended_0.154.3_windows-amd64\myblog\rcontent\rposts\AI安全入门指南.md" created
```

---

title:"AI安全入门"

date: 2026-01-10

categories: ["AI 安全"]

tags: ["人工智能", "机器学习", "安全"]

description:"了解AI系统面临的安全威胁和防护方法"

draft: false

#

AI安全入门

## 一、AI安全概述

AI系统面临独特的安全威胁，需要专门防护。

## 二、主要安全威胁

1.对抗样本攻击

- 添加微小扰动误导AI判断

- 导致错误分类

-防御：对抗训练

2. 数据投毒

- 污染训练数据

- 影响模型性能

-防御：数据清洗

3. 模型窃取

- 通过API查询复制模型

- 盗取知识产权

-防御：查询限制

浏览器访问：http://localhost:1313/myblog/categories/，此时就能看到个各个类型的文章。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/b331d0e8d08c047ec90283a99a95054925f8583d56fe70458c5d83a4c79209b9.jpg)


浏览器访问：http://localhost:1313/myblog-tags/，此时就能看到各个标签的

文章。点击其中的"安全"标签。就能查看所有属于"安全"标签的文章。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/3684d857e407c40429391787412017f0323c1a930ea75ad79511f32a0c3bcf88.jpg)


# 文章标签

Below you will find pages that utilize the taxonomy term “ 文章标签”

人工智能

人工智能

read more

安全

安全

read more

机器学习

机器学习

read more

加密

加密

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/2d7f3c8c716f6876437c3492f3fd6a1e77c606cdb9e9cc6e842f22371d0326ef.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/99bc4cfa61b909cff0bee724d5d5e81f51c8406b7f68f4f6cf644b92e5ebcdca.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/d28483713f442f66b5781b4b6f2d0f8d77199d8826b0b4aa98222f2c89bd149c.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/4caa3eda003f453e0af329d7b263f0de5d0c6a9a8c48a20d8d697b667e1ccb7c.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/9382bdff7291d3961c1d2e6a7e5e1bbc97731be714216f646b18a60ec041a9d5.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/7210b1fc5af08fb27d71f3b5d4ea72cca358eddf63fcba84ff3eed52fca42d83.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/e2e0cc0b13c2c2468f3f5d2578912a331652cc5896748a791202025afb7bcc0f.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/e2deebd801abf4067b524c94f25d702f6521144bd2d85295b5134ca1bd80c723.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/99cebdafeeeec8bc496189d485168c2b1b7b4914f1362490231bbbaba6ad6aff.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/fcebda4d650a9ca50e5191c3fca31fa760a0307e7b5c8552297faed7342c5ff8.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/6cc649efe468448a974cf45830a5b660c2dfc1c3cb870c0043027bd493cd1c0a.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/803d309c66799a492cb9beb88ffb967a945d2afad6957165606d19b07a5b4f7f.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/f555b68e83fb3631ac8fdeb81ff9bd64aef670b00eb1529b433662b5652df603.jpg)


我的博客

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/a6a00311d88d06b5c1ad429252b528492c315c949e537a3a80ac4dcc95df4a07.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/af8a5761a32061a737fcba3a5f4430f1c21ead5bf0882ab067073545e5741fd9.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/de01c1ec7063c014bd2c0d1b376530865a58c35aa9cff5e6602d58505921f5d7.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/197c4f357174e28e0369420f8d1cbd2987476c74465f420cea96d4b7beadf0f2.jpg)


# 安全

AI安全入门

AI安全入门

一、AI安全概述

AI系统面临独特的安全威胁，需要专门防护。

二、主要安全威胁

1.对抗样本攻击

·添加微小扰动误号AI判断

·导致错误分类

·防御：对抗训练

2.数据投毒

污染训练数据

影响模型性能

$\clubsuit$  防御：数据清洗

3. 椭型分析

通过API查询复制模型

·盗取知识产权

·防御：查询限制

read more

密码安全基础

一、密码安全重要性

密码是保护数字身份的第一道防线。刷密码会导致隐私泄露和财产损失。

二、密码学基础

1. 哈希函数

$\clubsuit$  单向加密，不可逆

·相同输入永远输出相同结果

·常见算法：SHA-256、b crypt

2.对称加密

·同一个密钥加密和解密

常用算法：AES

·适用于文件加密

3.非对称加密

·公明加密，私明解密

常用算法：RSA、ECC

·用于SSL证书、数字签名

三、密码存储安全

禁止的做法

也可逐个访问创建的3个文章页面，浏览器访问页面一：

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/613e5d7023c56fcab9a7620856812429bac8cdba9db879a40ba31f4a65df02ec.jpg)


浏览器访问页面二：http://localhost:1313/myblog/posts/密码安全基础/

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/8b2e37699327e4a1dbdf8a44c723d08ddf2e8d3b19cb29dedc8a5270cda8f41b.jpg)


浏览器访问页面三：http://localhost:1313/myblog/posts/ai安全入门/

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/9beb35c97f87baef52f59541212a6df0a06a7df198b87f82f325b193e0680795.jpg)


第三步：本地生成 HTML 文件

public 文件夹中保留的是实例化后的 HTML 文件以及依赖的其他静态文件。由于测试过程中可能会存在残留的旧文件，在最终使用时建议清空 public 文件夹。

# rmdir /s public

```batch
C:\hugoextended_0.154.3_windows-amd64\myblog>rmdir /s public public，是否确认(Y/N)?Y
```

也可直接手动清空。

重新生成 public 文件夹。

hugo.exe server

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/f34f6752c901336f902f0487607cead48199c0d403f2eb9faab0678e84c1fed8.jpg)


![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/78ec6aa395e58d5afcc05ca38d05b6621e82df15ded158b51812321d0b97de57.jpg)


# 通过Nginx部署博客网站

通过3.1上传网站代码提供的方法将本地生成的public文件夹上传到服务器的NginxWeb路径（/usr/share/nginx/html/）下，并改名为myblog。

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/ce4bf48507a0749cf8535d346e8ea46995b6fb96eafd6b500de8419eb29d1c8e.jpg)


使用以下命令修改/etc/nginx/sites-available/default的配置

```txt
nano /etc/nginx/sites-available/default
```

```txt
server { listen 80; listen [::]:80; server_name www.0xse.cc; # HTTP 到 HTTPS 重定向 location / { return 301 https://www.0xse.cc$request Uri; }   
}   
server { listen 443 ssl; listen [::]:443 ssl; server_name www.0xse.cc;
```

# SSL 配置

ssl_certicate /etc/letsencrypt/live/www.0xse.cc/fullchain.pem;

ssl_certificate_key /etc/letsencrypt/live/www.0xse.cc/privkey.pem;

# SSL协议和加密套件（安全推荐）

ssl_protocols TLSv1.2 TLSv1.3;

ssl_ciphers HIGH!!aNULL!!MD5;

其他配置保持不变

root /var/www/html;

index index.html index.htm index.nginx-debian.html;

# /myblog/ 路径配置

location \~ /myblog/ {

alias /usr/share/nginx/html/myblog/;

index index.html;

try_files $uri $uri/ /myblog/index.html;

}

location  $=$  /myblog{

return 301 /myblog/;

}

# 反向代理配置

location / {

proxy_pass http://127.0.0.1:8080;

```txt
} 1
```

注意：www.0xse.cc 为本手册的案例域名，学生实际操作中请替换为自己的域名。

验证 Nginx 配置语法是否正确，并使配置生效。

```txt
root@datacon-winterc:/usr/share/nginx/html#nginx-t  
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok  
nginx: configuration file /etc/nginx/nginx.conf test is successful  
root@datacon-winterc:/usr/share/nginx/html#nginx-s reload
```

浏览器访问：https://www.0xse.cc/myblog/

![image](https://cdn-mineru.openxlab.org.cn/result/2026-01-28/70dd1932-63fc-4a90-be82-1748f46f2017/b4f49f4b0634aa32b69c64b3899b0d1a399e95c0d3e32db7e74124a24d005fc4.jpg)


# 1.3.7 搭建自己博客

任务要求：

通过上面简单案例，成功的在服务器上搭建了一个博客系统。请同学们根据自己的喜好风格，创建自己的博客。

要求：每天生成一篇学习笔记，并根据笔记内容进行分类，以及为笔记添加标签方便快速定位，可使用AI美化自己博客的页面样式。