---
title: 我的TRIME配置
---

# 我的TRIME配置

[:cn:](README.md) | [:gb:](README_en.md) | [融合拼音](Original_README.md)

## 简介

以[融合拼音](https://github.com/tumuyan/rime-melt)为基础，参考[rimerc](https://github.com/Bambooin/rimerc)设置release。

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
- `symbols.yaml`，ver.1.5，2021-10-24，来自 [rime-prelude](https://github.com/rime/rime-prelude)
- `opencc/`，ver.1.1.3，提取自[Trime 3.2.4](https://github.com/osfans/trime/releases/tag/v3.2.4)，与[融合拼音](https://github.com/tumuyan/rime-melt)滤镜合并
- `essay.txt`，2021-08-05，来自 [rime-easay](https://github.com/rime/rime-essay) 八股文，预设词汇表和语言模型
- `rime.lua`，来自[融合拼音](https://github.com/tumuyan/rime-melt)
- `lua/`，来自[融合拼音](https://github.com/tumuyan/rime-melt)

字库推荐[天珩字库](http://cheonhyeong.com/Simplified/download.html)。

#### 输入方案文件，schema

以[融合拼音](https://github.com/tumuyan/rime-melt)为基础，关闭长词优先功能[^1]（`melt.schema.yaml`58行）。

[^1]: 个人习惯输入短词，且输入情境差异较大（生活聊天和专业交流频繁切换），长词优先干扰了输入效率。若需开启，则去掉`#`注释即可。

#### 方案词库文件，ex_dict

见[融合拼音](Original_README.md)[文件组成及授权](https://github.com/tumuyan/rime-melt#文件组成及授权)一节。`other`文件夹中存放部分拟作词典的中间产物（即未完成）。

[融合拼音](https://github.com/tumuyan/rime-melt)的主词库为`pinyin_simp.main.dict.yaml`，并未分离词库和词库加载文件。

#### 自定义词库，custom

- 新建空内容的`melt_eng_custom.dict.yaml`文件，以保证Trime能正常部署。

#### 主题文件，theme

- `trime_cn.yaml`，预设主题，提取自[Trime 3.2.4](https://github.com/osfans/trime/releases/tag/v3.2.4)，文字标签和注释改为简体（opencc转换）、部分`preset_keys`label修改。用于Trime依赖，避免Trime更新后被覆盖。
- `tongwenfeng.trime.yaml`，同文风主题，提取自[Trime 3.2.4](https://github.com/osfans/trime/releases/tag/v3.2.4)。用于Trime。
- `wendao.trime.yaml`，自定义，改为依赖`trime_cn.yaml`。用于Trime。
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

[^2]: 个人习惯，两分输入仅作为反查使用。
