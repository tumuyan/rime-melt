# 我的TRIME配置

[:cn:](README.md) | [:gb:](README_en.md) | [融合拼音](Original_README.md)

## 简介

母语与文字输入需求：普通话、汉字

简体字或言规范字，可以《通用规范汉字表》8105字为标准。在此之外则用《GB 18030-2005 信息技术 中文编码字符集》（单字节、双字节编码和四字节编码部分的CJK统一汉字扩充A部分为强制性）。

常用：[融合拼音](https://github.com/tumuyan/rime-melt)：以[袖珍簡化字拼音](https://github.com/rime/rime-pinyin-simp)为基础，[字海两分](http://cheonhyeong.com/Simplified/download.html)为反查，配合[Easy English](https://github.com/BlindingDark/rime-easy-en)。

参考[rimerc](https://github.com/Bambooin/rimerc)设置release。

目前仅适配[同文（Trime）输入法](https://github.com/osfans/trime/releases)

### 文件结构树

```cmd
├─basic
│  ├─lua
│  └─opencc
├─custom
├─ex_dict
├─others
├─schema
└─theme
    └─trime
```

### 分类

#### 基础与支持文件，basic

- `default.yaml`，预设文件，来自 [rime-prelude](https://github.com/rime/rime-prelude)
- `default.custom.yaml`，启用方案记录，空文件。
- `key_bindings.yaml`，来自 [rime-prelude](https://github.com/rime/rime-prelude)
- `punctuation.yaml`，来自 [rime-prelude](https://github.com/rime/rime-prelude)
- `symbols.yaml`，ver.1.6，2022-4-10，来自 [rime-prelude](https://github.com/rime/rime-prelude)
- `opencc/`，合并[opencc预编译包](https://github.com/BYVoid/OpenCC/wiki/Download#prebuild-%E9%A0%90%E7%B7%A8%E8%AD%AF)中`\build\share\opencc`，以及[融合拼音](https://github.com/tumuyan/rime-melt)中的`opencc`
- `essay.txt`，2021-08-05，来自 [rime-easay](https://github.com/rime/rime-essay) 八股文，预设词汇表和语言模型
- `rime.lua`，来自[融合拼音](https://github.com/tumuyan/rime-melt)
- `lua/`，来自[融合拼音](https://github.com/tumuyan/rime-melt)

修改：

1. 在`symbols.yaml`全角→多个相似符号中，插入部分常用半角符号（圆括号、方括号）
2. 【可选性】字库推荐[天珩字库](http://cheonhyeong.com/Simplified/download.html)、[霞鹜文楷](https://github.com/lxgw/LxgwWenKai)。

#### 输入方案文件，schema

- `liangfen.schema.yaml`，字海两分输入方案，来自[天珩的小站-下载页](http://cheonhyeong.com/Simplified/download.html)
- `melt.schema.yaml`，来自[融合拼音](https://github.com/tumuyan/rime-melt)
- `melt_eng.schema.yaml`，来自[融合拼音](https://github.com/tumuyan/rime-melt)
- `pinyin_simp.schema.yaml`，来自[融合拼音](https://github.com/tumuyan/rime-melt)
- `unicode.schema.yaml`，来自[Trime同文输入法QQ群]

以[融合拼音](https://github.com/tumuyan/rime-melt)(即袖珍简化字拼音+Easy Englishi+两分反查)为主。加入基于Lua脚本的Unicode字符输入方案。

#### 方案词库文件，ex_dict

详见[融合拼音](Original_README.md)[文件组成及授权](https://github.com/tumuyan/rime-melt#文件组成及授权)一节。`other`文件夹中存放部分拟作词典的中间产物（即未完成）。

- `pinyin_simp.main.dict.yaml`，主词库，词库加载文件
- `pinyin_simp_base.dict.yaml`，基础词库，现代汉语常用词表
- `pinyin_simp_chengyu.dict.yaml`，搜狗成语词库
- `pinyin_simp_gushi.dict.yaml`，搜狗古诗词库
- `pinyin_simp_moe.dict.yaml`，萌娘百科
- `pinyin_simp_wiki.dict.yaml`，维基百科
- `pinyin_simp_custom.dict.yaml`，自定义词库
- `melt_chs.dict.yaml`，融合拼音增补词库

#### 自定义词库，custom

- 新建空内容的`melt_eng_custom.dict.yaml`文件，以保证Trime能正常部署。

#### 主题文件，theme

- `wendao.trime.yaml`，自定义。用于Trime。
- `tongwenfeng.trime.yaml`，同文风主题，提取自[Trime 2022-06-05测试版](https://github.com/osfans/trime/actions/runs/2443077838)。用于Trime。增加了自动切换明暗模式。
- `weasel.custom.yaml`，用于小狼毫。

## 运行环境

1. 操作系统: Android 11(LineageOS 18.1)
2. 软件: [TRIME](https://github.com/osfans/trime)，同文输入法3.0

注： 理论上，可运行于其他 [RIME](https://rime.im)（librime）的输入法引擎中，如 [小狼毫](https://github.com/rime/weasel) 和 [鼠须管](https://github.com/rime/squirrel) 等。不过，肯定的是，主题文件（例如 `custom.yaml`，也作皮肤或外观）需重新设置。

## 用法

### 下载

①生成更新包。生成思路参考[rimerc](https://github.com/Bambooin/rimerc)，提供bat文件。

下载项目

1. 输入目标fcitx、fcitx5、ibus、squirrel、trime or weasel，目前只支持trime or weasel
2. 自动复制basic、schema、ex_dict、custom中的所有文件到releases文件夹
3. 根据输入，复制theme文件到releases文件夹
4. 【手动】将releases文件夹重命名为rime。

②使用提供的更新包

下载提供的releases

### 设置

1. 在“方案”启用【袖珍简化字拼音】【Easy English Nano】[^2]方案
1. 【Trime】在“键盘外观”启用`wendao`
1. Trime初次部署时间较长，需耐心等待

### 错误检查与修复

1、在【融合拼音】方案下无法混输英文

验证部署，查看`rime/build/`文件夹，是否存在`melt_eng.table.bin`。此步意在确定`melt_eng`词库部署是否出错，若缺失词库文件，则不会生成`melt_eng.table.bin`。

[^2]: 个人习惯，两分输入仅作为反查使用。初次使用，为保证反查，需勾选两分输入法，以加载词库。
