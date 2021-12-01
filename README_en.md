# My Trime Config

[:cn:](README.md) | [:gb:](README_en.md) | [Rime-melt](Original_README.md)

## Introduction

build on [Rime-melt](https://github.com/tumuyan/rime-melt), refer [rimerc](https://github.com/Bambooin/rimerc) to release.

Now, just match with [Trime](https://github.com/osfans/trime/releases)

### files tree

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

### Category

#### Basic

- `default.yaml`,  [rime-prelude](https://github.com/rime/rime-prelude)
- `default.custom.yaml`.
- `key_bindings.yaml`, from [rime-prelude](https://github.com/rime/rime-prelude)
- `punctuation.yaml`, from [rime-prelude](https://github.com/rime/rime-prelude)
- `symbols.yaml`, ver.1.5, 2021-10-24, from [rime-prelude](https://github.com/rime/rime-prelude)
- `opencc/`, ver.1.1.3, extract from [Trime 3.2.4](https://github.com/osfans/trime/releases/tag/v3.2.4), merger with [Rime-melt](https://github.com/tumuyan/rime-melt).
- `essay.txt`, 2021-08-05, from [rime-easay](https://github.com/rime/rime-essay) 
- `rime.lua`, from [Rime-melt](https://github.com/tumuyan/rime-melt)
- `lua/`, from [Rime-melt](https://github.com/tumuyan/rime-melt)

Recommend PanCJK font which called [TH-Tshyn](http://cheonhyeong.com/English/download.html)()

#### Schema

foundation of [rime-melt](https://github.com/tumuyan/rime-melt), and closed **long word filter**(lua_filter@long_word_filter).

#### Schema dictionary

see [rime-melt](https://github.com/tumuyan/rime-melt#文件组成及授权)

#### Theme

- `trime_cn.yaml`, for Trime, simplified Chinese.
- `tongwenfeng.yaml`, for Trime.
- `wendao.yaml`, for Trime, depends on `trime_cn.yaml`.
- `weasel.custom.yaml`, for Weasel.

## Prerequisites

1. OS: Android 11(LineageOS 18.1)
2. Software: [TRIME](https://github.com/osfans/trime)

Note: In theory, It's workable in other [RIME](https://rime.im)(librime) e.g., [Weasel](https://github.com/rime/weasel) and [Squirrel](https://github.com/rime/squirrel) etc. Assuredly, theme files(such as `custom.yaml`, aka skin, appearance) should be reset.

## Usage

### Download

### Setting
