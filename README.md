# 我的TRIME配置

[:cn:](README.md) | [:gb:](README_en.md) | [融合拼音](Original_README.md)

<<<<<<< HEAD
## 简介

母语与文字输入需求：普通话、汉字

简体字或言规范字，可以《通用规范汉字表》8105字为标准。在此之外则用《GB 18030-2005 信息技术 中文编码字符集》（单字节、双字节编码和四字节编码部分的CJK统一汉字扩充A部分为强制性）。

常用：

1. [融合拼音1.6.1](https://github.com/tumuyan/rime-melt)：以[袖珍簡化字拼音](https://github.com/rime/rime-pinyin-simp)为基础，[字海两分](http://cheonhyeong.com/Simplified/download.html)为反查，配合修改版[Easy English](https://github.com/BlindingDark/rime-easy-en)。
2. Unicode输入，基于lua脚本的Unicode输入方案

参考[rimerc](https://github.com/Bambooin/rimerc)设置release。

目前支持[同文（Trime）输入法](https://github.com/osfans/trime/releases)，尝试支持[小狼毫 fxliang维护版](https://github.com/fxliang/weasel/releases)

根据[融合拼音 2022-10-24](https://github.com/tumuyan/rime-melt/releases)和[Trime 3.2.8](https://github.com/osfans/trime/releases/tag/v3.2.8)重理全局。

## 说明

文件结构树

```cmd
├─basic
│  ├─fonts
│  ├─lua
│  └─opencc
├─custom
├─ex_dict
├─others
│   └─old
├─schema
└─theme
    └─trime
```

### 分类说明

#### Basic：基础与支持文件

##### 文件

- `default.yaml`，预设文件，来自 [rime-prelude](https://github.com/rime/rime-prelude)
- `default.custom.yaml`，启用方案记录，**空文件**
- `essay.txt`，2021-08-05，来自 [rime-easay](https://github.com/rime/rime-essay) 八股文，预设词汇表和语言模型
- `key_bindings.yaml`，来自 [rime-prelude](https://github.com/rime/rime-prelude)
- `punctuation.yaml`，来自 [rime-prelude](https://github.com/rime/rime-prelude)
- `rime.lua`，来自[融合拼音](https://github.com/tumuyan/rime-melt)，**有修改**
- `symbols.yaml`，ver.1.6，2022-4-10，来自 [rime-prelude](https://github.com/rime/rime-prelude)，**有修改**

在`symbols.yaml`全角→多个相似符号中，插入部分常用半角符号（圆括号、方括号）

##### 文件夹

- `fonts/`，**空文件夹**，用来存放字库文件
- `lua/`，来自[融合拼音](https://github.com/tumuyan/rime-melt)，**有修改**
- `opencc/`，合并[opencc预编译包](https://github.com/BYVoid/OpenCC/wiki/Download#prebuild-%E9%A0%90%E7%B7%A8%E8%AD%AF)中`\build\share\opencc`，以及[融合拼音](https://github.com/tumuyan/rime-melt)中的`opencc`

###### 字体

字库推荐

多平面字体

- 非商用：中华书局宋体、[天珩全字库 4.0](http://cheonhyeong.com/Simplified/download.html)、[全宋体](https://fgwang.blogspot.com/)
- 开源：花园明朝体

特定书体

- 旧字形宋体：[一点明体 8.0，2022-09-06](https://github.com/ichitenfont/I.Ming)
- 楷体：[霞鹜文楷](https://github.com/lxgw/LxgwWenKai)

更多开源字体可见[猫啃网](https://www.maoken.com/)的收集整理

###### lua脚本

- `lua_unicode_translator.lua`，Unicode翻译脚本，来自[Trime同文输入法QQ群](458845988)@[Shitlime](1753102572)
- `melt.lua`，来自[融合拼音](https://github.com/tumuyan/rime-melt)

#### Schema：输入方案文件

- `liangfen.schema.yaml`，字海两分5.0输入方案，来自[天珩的小站-下载页](http://cheonhyeong.com/Simplified/download.html)
- `melt_eng.schema.yaml`，来自[融合拼音](https://github.com/tumuyan/rime-melt)
- `melt_pinyin.schema.yaml`，来自[融合拼音](https://github.com/tumuyan/rime-melt)，**有修改**
- `unicode.schema.yaml`，来自[Trime同文输入法QQ群](458845988)@[Shitlime](1753102572)

修改

- 加入基于Lua脚本的Unicode字符输入方案。
- 在融合拼音中增加半全角切换。

#### Ex_dict：方案词库文件

melt方案要求如下，修改后的pinyin_simp方案与melt方案的词库要求一致。

详见[融合拼音](Original_README.md)[文件组成及授权](https://github.com/tumuyan/rime-melt#文件组成及授权)一节。`other`文件夹中存放部分拟作词典的中间产物（即未完成）。

1. 作为主词库的`pinyin_simp.main.dict.yaml`，同时也是词库加载文件
   1. `pinyin_simp.custom.dict.yaml`，自定义词语词库
   2. `pinyin_simp_base.dict.yaml`，基础词库，现代汉语常用词表
   3. `pinyin_simp_wiki.dict.yaml`，维基百科词库，选用的是去除中文后的精简版，@tumuyan抓取
   4. `pinyin_simp_moe.dict.yaml`，萌娘百科词库，@tumuyan抓取
   5. `pinyin_simp_chengyu.dict.yaml`，搜狗成语细胞词库，深蓝转换工具
   6. `pinyin_simp_gushi.dict.yaml`，搜狗古诗词库，深蓝转换工具
   7. `melt_chs.dict.yaml`，融合拼音增补词库
2. 作为反查词库的`liangfeng.dict.yaml`
3. `pinyin_simp_pin.txt`，固顶候选，用于加入常用词汇

melt_eng方案（即Easy Englishi Nano）要求：

1. 作为主词库的`melt_eng.dict.yaml`，同时也是词库加载文件
     1. `melt_mult_language.dict.yaml`，混合输入词汇
     2. `melt_eng_custom.dict.yaml`，自定义英文词库

其中自定义的词库有

- `pinyin_simp_custom.dict.yaml`，自定义中文词库
- `melt_eng_custom.dict.yaml`，自定义英文词库
- `pinyin_simp_pin.txt`，固顶

#### Theme：主题文件

- `wendao.trime.yaml`，自定义。用于Trime。
- `trime.yaml`，缺省主题，提取自[Trime 2022-06-05测试版](https://github.com/osfans/trime/actions/runs/2443077838)。用于Trime。
- `weasel.custom.yaml`，用于小狼毫。

#### Other

##### Old：停用文件备份

[融合拼音](https://github.com/tumuyan/rime-melt)1.6以前通过与袖珍拼音嵌合实现

- `melt.schema.yaml`，来自[融合拼音](https://github.com/tumuyan/rime-melt)
- `pinyin_simp.schema.yaml`，来自[融合拼音](https://github.com/tumuyan/rime-melt)
- `pinyin_simp.custom.yaml`，来自[融合拼音](https://github.com/tumuyan/rime-melt)

## 我的运行环境


1. 操作系统: Android 12L(LineageOS 19)、Windows 11
2. 软件: [TRIME](https://github.com/osfans/trime)，同文输入法3.0、[小狼毫](https://github.com/fxliang/weasel/releases)
=======
## 特点
* 这是一个打包解决方案。在<=1.6.1的版本中，尽量保持了原有项目的文件结构，通过引用、patch实现修改效果。因此当用户对rime稍微熟悉后，可以方便地更换、增删其中的某部分，而不至于产生严重的错误。在1.6.1之后的版本中做了若干调整，不再使用patch机制。
* 本方案与Easy English词汇和方案差异极大，故更名为Easy English Nano。相关特性详见[关于Easy English Nano](#关于Easy_English_Nano)章节。
* 本方案创造性地在中文词库中加入了大量中英文混拼词条、含标点词条，如：`汉斯·阿尔伯特·爱因斯坦`、`梅赛德斯-奔驰`、`哆啦A梦`、`高Ping战士`等。这些词条既可以全拼（包含完整英语单词或者字母），也可以简拼（只拼写拼音和英语的首字母）。
* 本方案引入叶典网[【两分输入方案】](http://cheonhyeong.com/Simplified/download.html)作为反查滤镜。当用户需要输入生僻字时，可以对复杂文字进行拆分，先输入"`"，再输入第一部分的拼音，最后输入第二部分的拼音。如果本地存在候选词的拼音，会通过opencc滤镜显示该文字的读音。
* 本方案设计了长词优先算法。比如Rime拼音方案输入"xian"，第一页候选词通常没有"xi'an"读音的词条（因为简拼的优先级要低于全拼，编码完全匹配的优先级要高于编码含分割符）；使用本方案会强行提升至多3个中文、2个英文长词候选的排序到第一页。
* 本方案设计了变量算法。输入`值=oo`和`值=ii`，可以设置oo和ii两个变量。当候选词为成句时，算法自动替换候选词中的"Oo"和“Xx”为变量值（注意大小写。另外换行请使用`<br>`而不是`\n`）。`pinyin_simp_custom.dict.yaml`中已经预设了若干示例作为参考。当需要输入词库中没有的英语作为变量，且中文候选词造成干扰时，可以先输入一部分字符，按shift切换至英文状态，再继续输入剩余内容。

## 冲突
* 如果你已经安装两分输入方案、Easy English、袖珍简化字拼音方案，并且与本方案存在文件冲突，替换不替换均可正常使用，但是实际使用的词库会有差别。
* 如果你已经使用lua滤镜，lua滤镜存在冲突。rime.lua文件的内容需要手动合并。
* 如果你已经安装opencc拼音滤镜，可能与本方案存在冲突，但是替换不替换均可。


## 安装
 目前本方案没有加入东风破，需要下载文件并放置到方案目录来使用。 
1. [下载文件](https://github.com/tumuyan/rime-pinyin-simp/archive/master.zip)、解压文件
2. 删除解压后others目录中不必要的文件。
    * `rime.lua`是lua滤镜，如果你的其他输入方案已经预设了lua滤镜，需要手动合并此文件的内容到用户文件夹内的rime.lua文件中，完成文件引用。否则直接复制到`Rime用户文件夹`内即可
    * `custom`目录下`melt_eng_custom.dict.yaml`和`pinyin_simp_custom.dict.yaml`分别是英文、中文用户自定义词库，由用户自己维护。如果`Rime用户文件夹`内没有这几个文件，请拷贝；如果存在，请不要替换，避免自己积累的词条被覆盖。
    * `others`目录的文件仅供参考，可以直接删除。其中`symbols.yaml`为符号配置文件，`default.yaml`为默认配置文件。如果`程序文件夾`缺少这些文件，大部分方案都会部署失败。如果`程序文件夾`内没有这几个文件，请拷贝；如果存在，请不要替换，避免自己的设置被覆盖。
3. 剪切opencc目録到`程序文件夾`内。路径位置：
    * 【小狼毫】 C:\Program Files (x86)\Rime\weasel-0.14.3\data 
4. 复制剩余文件(包含lua子目录)到`Rime用户文件夹`内。用户文件夹位置：  
    * 【中州韻】 ~/.config/ibus/rime/ （0.9.1 以下版本爲 ~/.ibus/rime/）
    * 【小狼毫】 %APPDATA%\Rime
    * 【鼠鬚管】 ~/Library/Rime/
5. 启用 [融合拼音/melt_pinyin] [liangfen]和 [Easy English Nano] 方案，等待完成部署。
6. 打开 Rime 方案选单（输入状态下按`Ctrl + ~`），切换至 [融合拼音] 即可开始使用。
>>>>>>> 64fc9130b1e57951fed8ba926f4d97c48d92699a

注： 理论上，可运行于其他 [RIME](https://rime.im)（librime）的输入法引擎中，如 [小狼毫](https://github.com/rime/weasel) 和 [鼠须管](https://github.com/rime/squirrel) 等。不过，肯定的是，主题文件（例如 `custom.yaml`，也作皮肤或外观）需重新设置。

<<<<<<< HEAD
## 用法
=======
## 更新
通常直接下载并覆盖文件、重新部署即可。
特别地，由于文件结构变更，从1.6.1往更高版本升级，需要重新勾选方案进行部署，复制同步目录中的`pinyin_simple.userdb.txt`为`melt_pinyin.userdb.txt`，并打开此文件，修改文件头部的`pinyin_simple`为`melt_pinyin`，重新同步。


## 使用
* 由于常见的简繁转换快捷键`Ctrl + Shift + F`与部分IDE的快捷键存在冲突，故本方案设置快捷键为`Ctrl + Shift + Space`
* 在存在候选词时，快捷键`Ctrl + Shift + P`可以快速切换拼音滤镜
* 输入引导符号`可以调用两分方案
其他常规快捷键参考末尾折叠段落的[快捷键](#使用快捷键)章节
>>>>>>> 64fc9130b1e57951fed8ba926f4d97c48d92699a

### 下载

<<<<<<< HEAD
①生成更新包。生成思路参考[rimerc](https://github.com/Bambooin/rimerc)，提供bat文件。
=======
-  `melt_pinyin.schema.yaml` ：融合拼音主方案文件。参考了[【袖珍简化字拼音】](https://github.com/rime/rime-pinyin-simp/) 和 [【Rime 简体中文用户定制文件】](https://github.com/huaxianyan/Rime)。  
-  `melt_pinyin.dict.yaml`: 融合拼音词主库文件。引用了其他词库，文件本身只包含少量词条。
>>>>>>> 64fc9130b1e57951fed8ba926f4d97c48d92699a

下载项目

<<<<<<< HEAD
1. 输入目标fcitx、fcitx5、ibus、squirrel、trime or weasel，目前只支持trime or weasel
2. 根据输入，复制theme文件到releases文件夹中的rime文件夹
3. 自动复制basic、schema、ex_dict、custom中的所有文件到releases文件夹中的rime文件夹
4. 调用7-zip，将releases文件夹压缩

②使用提供的发行包
=======
- ~~`pinyin_simp.custom.yaml` ：袖珍简化字拼音方案的客制化配置文件，有改动。~~已经删除
- `pinyin_simp.main.dict.yaml` ：词库中心文件。词库内容由 [袖珍简化字拼音](https://github.com/rime/rime-pinyin-simp) 默认词库pinyin_simp.dict.yaml修改而来，故合并两者并保持同步。
- `pinyin_simp_base.dict.yaml` ：基础词库，由额外词库文件引用使用，来源为项目 [https://github.com/alswl/Rime](https://github.com/alswl/Rime) 中的[「现代汉语常用词表」](https://raw.githubusercontent.com/alswl/Rime/master/luna_pinyin.xiandaihanyuchangyongcibiao.dict.yaml)。
- ~~`cn_en.dict.yaml` ： 英文词库。~~ 已删除。
- ~~`zhwiki.dict.yaml` ：维基词库。来源为项目 [fcitx5-pinyin-zhwiki](https://github.com/felixonmars/fcitx5-pinyin-zhwiki)。~~ 已经删除，改为自己解析wiki dump文件并生成词库。  
  
以下词库仅保持结构，实际上并没有在积极维护，由最终用户根据实际需求来编辑：  
- `pinyin_simp_custom.dict.yaml` ：自定义词语，由额外词库文件引用使用。如需添加自定义短语，建议编辑此文件。目前预设了一些最新最in的💈文学。

>>>>>>> 64fc9130b1e57951fed8ba926f4d97c48d92699a

### 设置

1. 在“方案”启用【袖珍简化字拼音】【Easy English Nano】[^2]方案
1. 【Trime】在“键盘外观”启用`wendao`
1. Trime初次部署时间较长，需耐心等待

### 错误检查与修复

<<<<<<< HEAD
1、在【融合拼音】方案下无法混输英文

验证部署，查看`rime/build/`文件夹，是否存在`melt_eng.table.bin`。此步意在确定`melt_eng`词库部署是否出错，若缺失词库文件，则不会生成`melt_eng.table.bin`。

[^2]: 个人习惯，两分输入仅作为反查使用。初次使用，为保证反查，需勾选两分输入法，以加载词库。
=======
【融合拼音增补词库】  
求人不如求己，用[【深蓝词库转换】](https://github.com/studyzy/imewlconverter)转换搜狗细胞词库及其他方式获取的语料，并手动更新。（然而显而易见，搜狗目前的策略并不是通过更新离线词库来改善用户的输入体验，聊胜于无罢了；wiki作为词库，也并非上佳选择）
- `pinyin_simp_chengyu.dict.yaml`：搜狗成语俗语细胞词库 https://pinyin.sogou.com/dict/detail/index/15097   
更新：2017-03-30 20:46:10
- `pinyin_simp_gushi.dict.yaml`：搜狗古诗细胞词库 https://pinyin.sogou.com/dict/detail/index/2  
更新：2020-12-28 15:05:44  
- `pinyin_simp_wiki.dict.yaml`：使用维基百科提供的dump数据解析而得。和别人作品不同，包含了大量中英文混拼词条、含标点的词条。**由于实用性较低，在1.6之后不再保留纯中文词条，以降低简拼运算量**。不定期更新，每月至少1次。  
[下载直链](https://github.com/tumuyan/rime-pinyin-simp/raw/master/pinyin_simp_wiki.dict.yaml)
- `pinyin_simp_moe.dict.yaml`：使用萌娘百科提供的API数据解析而得，含大量二次元词条。和别人作品不同，包含了大量中英文混拼词条、含标点的词条。不定期更新，每月至少1次。    
[下载直链](https://github.com/tumuyan/rime-pinyin-simp/raw/master/pinyin_simp_moe.dict.yaml)  

手动维护的含外语、数字和符号混合的词条：  
- `melt_mult_language.dict.yaml`：少量中外语、数字和符号混合的词库，供`Easy English Nano`方案引用。

【融合拼音参考文件】  
- `/others/*.csv`: 整理中的增补字典，除常见国家和语言外均未实装。可直接删除  
- `/others/废词*.txt`：废词列表。
- `/others/修复*.txt`：为避免预处理词条时被正则过杀，设置的废词白名单。
- `/opencc`: opencc拼音滤镜。原作者不祥。`PYCharacters.txt`为单字拼音，文字基于两分输入法词库列出的单字，拼音查自国学大师网，并处理多音字为`[读音1&nbsp读音2]`的形式。`PYPhrases.txt`为词条拼音，也略有调整。
- `/lua/melt.lua`：融合拼音的预设lua滤镜。


## 关于Easy_English_Nano
### 与Easy English的词库差异
* 只保留了较常用的词汇，并非单纯为了提高混打中英文时的打字速度，而是借用字典机制对输入的单词的正确性和大小写进行校对。基于@tanzi制作的包含2016考研词汇大纲和六级单词词库进行更新。
* 部分单词拼写存在英式英语和美式英语的差别，以符合国内（其实是本人）拼写习惯。通过核查，多数单词实际上是美式拼写习惯，少部分为英式，也有少部分保留了两种拼写。此部分改动并未完全落实。  
    使用美式的有如下参考规律：  

    |拼写规律|例词1|例词2|   
    | :----: | :----: | :----: |  
    | 英式our，美式写成or, 选择美式 | colour **color** | favourite **favorite**  |  
    | 英式词尾me/ue不发音，美式删掉 | kilogramme **kilogram** |catalogue **catalog** |  
    | 英式中的ise结尾，美式改成ize | apologise **apologize** | recognise **recognize** |  
    | 英式的re和美式的er | theatre **theater** | centre **center** |  
    | 英式的ce和美式的se | licence **license** |  |    
    |   |   |   |
    
    选用英式英语的例子：  
    - railway 是英式英语，railroad是美式英语，使用railway  

### 与Easy English的方案差异
* 内置了大小写转换。允许用小写字母输入拼大小写混合的单词，允许首字母大写输入全大写的单词。允许大写首字母把词库中的小写单词转为首字母大写，允许大写前2个字母把词库中的小写单词转为大写单词。举例：
  
    | 词库 | 输入 | 候选 | 
    | :----: | :----: | :----: |
    | ASCII | As | ASCII ~CII |
    | Apple | ap | Apple ~ple |
    | Apple | Ap | Apple ~ple |
    | tool | To | Tool +ol |
    | tool | TO | TOOL +ol |
    |   |   |   |
  
* 能够自动处理编码中的单个+-_符号。如果词条包含了其他符号或多个符号，比如空格，需要手动去除码表中的特殊符号。

* 不会生成自造词（避免输入错误造成的字典污染）。作为补充，制作了自动编辑用户字典的lua滤镜输入。输入单词并使用`--`结尾时，输入的键盘码会自动保存到`melt_eng_custom.dict.yaml`中。当用户重新部署时，新的词条会生效。


# 其他

<details>
<summary>以下内容修改自袖珍简化字拼音的Readme和Rime项目Wiki</summary>

## 袖珍简化字拼音

配方： ℞ **pinyin-simp**

[Rime](https://rime.im) 袖珍简化字拼音輸入方案

### [Rime说明书](https://github.com/rime/home/wiki/UserGuide)   
## 使用快捷键

- 设置：在Rime输入状态下，按  `F4`  鍵或組合鍵  ``Ctrl+` ``  喚出輸入方案選單（`` ` ``  鍵常見於  `1`  的左方），可以进入输入方案及选项设置。
使用 ←→鍵 定位光標插入點「‸」（或顯示爲「›」），編輯輸入碼。 也可用來縮短後選詞所對應輸入碼的範圍、確認詞句的一部分。
- 光标：
`Home`、`End`  鍵 快速跳至句首、句末。
`BackSpace`、`Delete`  鍵 分別刪除光標前、後的編碼字符。注意在蘋果鍵盤上前者標註爲  `Delete`，後者通常是組合鍵  `Fn+Delete`。
`Escape`  鍵 清空未完成的輸入。

- 刪除誤上屏的錯詞：先把選字光標（用上、下鍵）移到要刪除的用戶詞組上，再按下  `Shift+Delete`  或  `Control+Delete`（蘋果鍵盤用  `Shift+Fn+Delete`）。 
这个操作只能從用戶詞典中刪除詞組。用於碼表中原有的詞組時，只會取消其調頻效果。

- 输出编码区内容: `Ctrl+Shift+Enter`

### 輸入標點符號

按鍵到標點符號的映射有三種形式：

-   按鍵對應惟一的符號，按鍵後直接輸出該符號，如「，」
-   按鍵對應一組配對的符號，符號交替出現，如「“”」
-   按鍵對應多種符號，按鍵後展現選單。此時可按空格鍵或回車鍵確認高亮的符號，反復按該鍵則選中下一種符號。

每一款輸入方案，都可以定義兩套符號表，以「方案選單」裏的選項「半角←→全角」往復切換。

### 中西文切換

打開「方案選單」，使用選項「中文←→西文」可在兩種轉換狀態間往復切換。

此外，默認可用左右  `Shift`  鍵快速切換。

**特别的**，在輸入了部分編碼的情況下，左  `Shift`  切換輸入法光標左面的編碼內容，右  `Shift`  切換光標右面即將輸入的內容。

注意：Mac 系統上的鼠鬚管不能區分左、右  `Shift`  ，因此左、右  `Shift`  鍵的作用一樣。


### Emacs 風格的編輯鍵

註：Windows 版本 Alt 組合鍵不可用。

-   ↑：`Control+p`
-   ↓：`Control+n`
-   ←：`Control+b`
-   →：`Control+f`
-   上頁：`Alt+v`
-   下頁：`Control+v`
-   句首：`Control+a`
-   句末：`Control+e`
-   回退：`Control+h`
-   刪除：`Control+d`
-   清空：`Control+g`
-   刪詞：`Control+k`

</details>
>>>>>>> 64fc9130b1e57951fed8ba926f4d97c48d92699a
