# 我的 TRIME 配置

[CN](README.md) | [EN](README_en.md)

forked [Rime-melt](README_origin.md)

## 简介

文字输入需求：汉语（现代汉语和古代汉语）、英文（常用词汇）、特殊符号。

简体字或言规范字，以[《通用规范汉字表》[^1]](http://www.gov.cn/zhengce/content/2013-08/19/content_1289.htm)8105 字为标准。在此之外则用《GB 18030-2005 信息技术 中文编码字符集》（单字节、双字节编码和四字节编码部分的 CJK 统一汉字扩充 A 部分为强制性）。

参考[rimerc](https://github.com/Bambooin/rimerc)设置 release。

目前支持[同文（Trime）输入法](https://github.com/osfans/trime/releases)，尝试支持[小狼毫 fxliang 维护版](https://github.com/fxliang/weasel/releases)

[^1]: 国务院关于公布《通用规范汉字表》的通知：国发〔2013〕23号

### 输入方案

1. [融合拼音](https://github.com/tumuyan/rime-melt)：以[袖珍簡化字拼音](https://github.com/rime/rime-pinyin-simp)、[【Rime 简体中文用户定制文件】](https://github.com/huaxianyan/Rime)为基础，[字海两分](http://cheonhyeong.com/Simplified/download.html)为反查，配合修改版[Easy English](https://github.com/BlindingDark/rime-easy-en)实现了简体中文和常用英语的混合输入。
2. [雾凇拼音](https://github.com/iDvel/rime-ice)，一个长期维护的简体词库，包含全拼和常用的自然码双拼、小鹤双拼、微软双拼
3. Unicode 输入：基于 lua 脚本的 Unicode 输入方案，解决部分未支持的字符输入问题，建议配合[babelpad](https://www.babelstone.co.uk/Software/BabelPad.html)（Windows OS）、unicodepad（Android OS）、[unicode 字符百科](https://unicode-table.com/)（web）等工具、或[unicode 标准文件](https://home.unicode.org/)。

### 辞典（dictionaries）

字符\t编码\t频率（非负整数）

#### 字典

以目前笔者所知最大的汉字字库“全宋体”来看，至少汉字约有18万余。而字典释义中大概在10万字左右，其中有大量的异体、同形、避讳缺笔等字形。据WFG先生统计，[台湾“教育部”异体字字典](https://dict.variants.moe.edu.tw/)合并同形字后实际收字96800字，略少于<汉字海>。

通用规范上，当前的Unicode中CJK Unified（20992字）、CJK Ext-A（6592字）、CJK Ext-B（42720字）、CJK Ext-C（4153字）、CJK Ext-D（222字）、CJK Ext-E（5762字）、CJK Ext-F（7473字）、CJK Ext-G（4939字）、CJK Ext-H（4192字），合计97045字。

总得来说，在九万七千余汉字中，覆盖99%使用场景的，大概是8000多字。以[邢红兵等在2019年公开的25亿字语料汉字字频表](https://faculty.blcu.edu.cn/xinghb/zh_CN/article/167473/content/1437.htm)来看，14975字覆盖了约19亿的字频。

#### 词语

#### 语句

## 说明

文件结构树

```cmd
├─basic
│  ├─[fonts]
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
- `essay.txt`，2023-02-04，来自 [rime-easay](https://github.com/rime/rime-essay) 八股文，预设词汇表和语言模型
- `key_bindings.yaml`，来自 [rime-prelude](https://github.com/rime/rime-prelude)
- `punctuation.yaml`，来自 [rime-prelude](https://github.com/rime/rime-prelude)
- `rime.lua`，来自[融合拼音](https://github.com/tumuyan/rime-melt)，**有修改**，加入 unicode_translate 脚本的调用
- `symbols.yaml`，ver.1.6，2022-4-10，来自 [rime-prelude](https://github.com/rime/rime-prelude)，**有修改**，在 `symbols.yaml`全角 → 多个相似符号中，插入部分常用半角符号（圆括号、方括号）

##### 文件夹

- `fonts/`，**空文件夹**，用来存放字库文件，详见[字体](#字体)一节
- `lua/`，来自[融合拼音](https://github.com/tumuyan/rime-melt)，**有修改**，详见[lua 脚本](#lua-脚本)一节
- `opencc/`，合并[opencc 预编译包](https://github.com/BYVoid/OpenCC/wiki/Download#prebuild-%E9%A0%90%E7%B7%A8%E8%AD%AF)中 `\build\share\opencc`与融合拼音](https://github.com/tumuyan/rime-melt)中的 `opencc`

###### 字体

多平面字体

- 非商用：中华书局宋体、[天珩全字库 4.0](http://cheonhyeong.com/Simplified/download.html)、[全宋体](https://fgwang.blogspot.com/)
- 开源：花园明朝体

特定书体

- 旧字形宋体：[一点明体 8.0，2022-09-06](https://github.com/ichitenfont/I.Ming)
- 楷体：[霞鹜文楷](https://github.com/lxgw/LxgwWenKai)

更多开源字体可见[猫啃网](https://www.maoken.com/)的收集整理

###### lua 脚本

- `lua_unicode_translator.lua`，Unicode 转字符脚本，来自[Trime 同文输入法 QQ 群](458845988)@[Shitlime](1753102572)
- `melt.lua`，来自[融合拼音](https://github.com/tumuyan/rime-melt)

#### Schema：输入方案文件

- `liangfen.schema.yaml`，字海两分 5.0 输入方案，来自[天珩的小站-下载页](http://cheonhyeong.com/Simplified/download.html)
- `melt_eng.schema.yaml`，来自[融合拼音](https://github.com/tumuyan/rime-melt)
- `melt_pinyin.schema.yaml`，来自[融合拼音](https://github.com/tumuyan/rime-melt)
- `melt_pinyin.custom.yaml`，在融合拼音中增加半全角切换。
- `unicode.schema.yaml`，来自[Trime 同文输入法 QQ 群](458845988)@[Shitlime](1753102572)

#### Ex_dict：方案词库文件

melt 方案要求如下，修改后的 pinyin_simp 方案与 melt 方案的词库要求一致。

详见[融合拼音](README_origin.md)[文件组成及授权](README_origin.md#文件组成及授权)一节。`other`文件夹中存放部分拟作词典的中间产物（即未完成）。

1. 作为主词库的 `melt_pinyin.dict.yaml`，同时也是词库加载文件
   1. `pinyin_simp.main.dict.yaml`，袖珍简化字拼音主词库
   2. `pinyin_simp_base.dict.yaml`，基础词库，现代汉语常用词表
   3. `pinyin_simp_wiki.dict.yaml`，维基百科词库，选用的是去除中文后的精简版，@tumuyan 抓取
   4. `pinyin_simp_moe.dict.yaml`，萌娘百科词库，@tumuyan 抓取
2. 作为反查词库的 `liangfeng.dict.yaml`
3. 作为扩展的转换词库（深蓝转换工具）
   1. `pinyin_simp_chengyu.dict.yaml`，搜狗细胞词库-成语
   2. `pinyin_simp_gushi.dict.yaml`，搜狗细胞词库-古诗

melt_eng 方案（即 Easy Englishi Nano）要求：

1. 作为主词库的 `melt_eng.dict.yaml`，同时也是词库加载文件
   1. `melt_mult_language.dict.yaml`，多语言字符拉丁化输入

uncode 方案要求：

- `uncode.dict.yaml`，无内容

#### Custom：自定义部分

- `pinyin_simp_custom.dict.yaml`，袖珍简化字拼音自定义词语词库
- `melt_eng_custom.dict.yaml`，自定义英文词库
- `pinyin_simp_pin.txt`，固顶

#### Theme：主题文件

- `wendao.trime.yaml`，自定义。用于 Trime。
- `trime.yaml`，缺省主题，提取自[Trime](https://github.com/osfans/trime)。用于 Trime。
- `weasel.custom.yaml`，用于小狼毫。

#### Other

##### Old：停用文件备份

[融合拼音](https://github.com/tumuyan/rime-melt)1.6 以前通过与袖珍拼音嵌合实现

- `melt.schema.yaml`，来自[融合拼音](https://github.com/tumuyan/rime-melt)
- `pinyin_simp.schema.yaml`，来自[融合拼音](https://github.com/tumuyan/rime-melt)
- `pinyin_simp.custom.yaml`，来自[融合拼音](https://github.com/tumuyan/rime-melt)

## 我的运行环境

1. 操作系统: Android 12L(LineageOS 19)、Windows 11
2. 软件: [TRIME](https://github.com/osfans/trime)，同文输入法 3.0、[小狼毫](https://github.com/fxliang/weasel/releases)

### 下载

① 生成更新包。生成思路参考[rimerc](https://github.com/Bambooin/rimerc)，提供 bat 文件。

1. 输入目标 fcitx、fcitx5、ibus、squirrel、trime or weasel，目前只支持 trime or weasel
2. 根据输入，复制 theme 文件到 releases 文件夹中的 rime 文件夹
3. 自动复制 basic、schema、ex_dict、custom 中的所有文件到 releases 文件夹中的 rime 文件夹
4. 调用 7-zip，将 releases 文件夹压缩

② 使用提供的发行包

### 设置

1. 在“方案”启用【袖珍简化字拼音】【Easy English Nano】[^2]方案
2. 【Trime】在“键盘外观”启用 `wendao`
3. Trime 初次部署时间较长，需耐心等待

### 错误检查与修复

1、在【融合拼音】方案下无法混输英文

验证部署，查看 `rime/build/`文件夹，是否存在 `melt_eng.table.bin`。此步意在确定 `melt_eng`词库部署是否出错，若缺失词库文件，则不会生成 `melt_eng.table.bin`。

[^2]: 个人习惯，两分输入仅作为反查使用。初次使用，为保证反查，需勾选两分输入法，以加载词库。
