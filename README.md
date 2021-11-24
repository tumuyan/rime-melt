# 我的TRIME配置

[:cn:](README.md) | [:gb:](README_en.md) | [融合拼音](Original_README.md)

## 简介

以[融合拼音](https://github.com/tumuyan/rime-melt)为基础，参考rimerc设置release。

目前仅适配同文（trime）输入法

### 文件结构树

```
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

- `lua`，来自[融合拼音](https://github.com/tumuyan/rime-melt)
- `opencc`，ver.1.1.2，提取自Trime 3.2.3，与[融合拼音](https://github.com/tumuyan/rime-melt)滤镜合并
- `essay.txt`，2021-08-05，来自 [rime-easay](https://github.com/rime/rime-essay) 八股文，预设词汇表和语言模型
- `rime.lua`，来自[融合拼音](https://github.com/tumuyan/rime-melt)
- `symbols`，ver.1.5，2021-10-24，来自 [rime-prelude](https://github.com/rime/rime-prelude)

字库推荐[天珩字库](http://cheonhyeong.com/Simplified/download.html)。

#### 输入方案文件，schema

以[融合拼音](https://github.com/tumuyan/rime-melt)为基础，关闭长词优先功能[^1]（`melt.schema.yaml`58行）。

[^1]: 个人习惯输入短词，且输入情境差异较大（生活聊天和专业交流频繁切换），长词优先干扰了输入效率。若需开启，则去掉`#`注释即可。

#### 方案词库文件，ex_dict

见[融合拼音](Original_README.md)**[文件组成及授权](https://github.com/tumuyan/rime-melt#文件组成及授权)**一节。`other`文件夹中存放部分拟作词典的中间产物（即未完成）。

[融合拼音](https://github.com/tumuyan/rime-melt)的主词库为`pinyin_simp.main.dict.yaml`，并未分离词库和词库加载文件。

#### 主题文件

- `trime.yaml`，预设主题，提取自Trime 3.2.3，注释改为简体（opencc转换）。用于Trime。
- `tongwenfeng.yaml`，同文风主题，提取自Trime 3.2.3。用于Trime。
- `wendao.yaml`，自定义，依赖trime。用于Trime。
- `weasel.custom.yaml`，用于小狼毫。

## 运行环境

1. 操作系统: Android 11(LineageOS 18.1)
2. 软件: [TRIME](https://github.com/osfans/trime)，同文输入法3.0

注： 理论上，可运行于其他 [RIME](https://rime.im)（librime）的输入法引擎中，如 [小狼毫](https://github.com/rime/weasel) 和 [鼠须管](https://github.com/rime/squirrel) 等。不过，肯定的是，主题文件（例如 `custom.yaml`，也作皮肤或外观）需重新设置。

## 用法

### 下载

生成思路参考rimerc，提供bat文件。

1. 输入目标fcitx、fcitx5、ibus、squirrel、trime or weasel，目前只支持trime or weasel
2. 复制base、schema、ex_dictionary、custom到releases文件夹
4. 根据输入，复制theme到releases文件夹
4. 将releases文件夹重命名为rime。

### 设置

1. 启用【袖珍简化字拼音】【Easy English Nano】[^2]

[^2]: 个人习惯，两分输入仅作为反查使用。
