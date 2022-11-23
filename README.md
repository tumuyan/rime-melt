# 我的TRIME配置

[:cn:](README.md) | [:gb:](README_en.md) | [融合拼音](Original_README.md)

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

注： 理论上，可运行于其他 [RIME](https://rime.im)（librime）的输入法引擎中，如 [小狼毫](https://github.com/rime/weasel) 和 [鼠须管](https://github.com/rime/squirrel) 等。不过，肯定的是，主题文件（例如 `custom.yaml`，也作皮肤或外观）需重新设置。

## 用法

### 下载

①生成更新包。生成思路参考[rimerc](https://github.com/Bambooin/rimerc)，提供bat文件。

下载项目

1. 输入目标fcitx、fcitx5、ibus、squirrel、trime or weasel，目前只支持trime or weasel
2. 根据输入，复制theme文件到releases文件夹中的rime文件夹
3. 自动复制basic、schema、ex_dict、custom中的所有文件到releases文件夹中的rime文件夹
4. 调用7-zip，将releases文件夹压缩

②使用提供的发行包

### 设置

1. 在“方案”启用【袖珍简化字拼音】【Easy English Nano】[^2]方案
1. 【Trime】在“键盘外观”启用`wendao`
1. Trime初次部署时间较长，需耐心等待

### 错误检查与修复

1、在【融合拼音】方案下无法混输英文

验证部署，查看`rime/build/`文件夹，是否存在`melt_eng.table.bin`。此步意在确定`melt_eng`词库部署是否出错，若缺失词库文件，则不会生成`melt_eng.table.bin`。

[^2]: 个人习惯，两分输入仅作为反查使用。初次使用，为保证反查，需勾选两分输入法，以加载词库。
