# wendao 设计

## 键盘设计

### Unicode 输入键盘

Unicode 现行为16进制编码，即有16个输入字符[0-9, A-F]。控制按键有：空格（确认输入），退格键（删除误输入）。使用场景为：输入Unicode已知或熟知，而其他输入方案较难或不易输入的字符，如全角空格、高扩展区（B以上）字符。为经济目的，键盘模仿计算器按钮设计。

词典性应用：UnicodePad

```yaml
#line1
- {click: "A"}
- {click: "B"}
- {click: "C"}
- {click: BackSpace}
#line2
- {click: "7"}
- {click: "8"}
- {click: "9"}
- {click: "D"}
#line3
- {click: "4"}
- {click: "5"}
- {click: "6"}
- {click: "E"}
#line4
- {click: "1"}
- {click: "2"}
- {click: "3"}
- {click: "F"}
#line5
- {click: Schema_switch, long_click: Menu}
- {click: "0"}
- {click: space, width: 50}
```

### 注音键盘

- 辅音送气合并、平翘舌合并，声母21个合并为13个。
- 介母3个保留。
- 开口呼韵母，合并ㄜㄝ，保留12个。

共计28个。

```yaml
# line 1
- {click: "ㄅ", long_click: "ㄆ"}
- {click: "ㄉ", long_click: "ㄊ"}
- {click: "ㄏ", long_click: ""}
- {click: "ㄓ", long_click: "ㄗ"}
- {click: "ㄧ", long_click: ""}
- {click: "ㄚ", long_click: ""}
- {click: "ㄞ", long_click: ""}
- {click: "ㄡ", long_click: ""}
- {click: "ㄣ", long_click: ""}
- {click: "ㄥ", long_click: ""}
#line2
- {click: "ㄇ", long_click: ""}
- {click: "ㄋ", long_click: "ㄌ"}
- {click: "ㄍ", long_click: "ㄎ"}
- {click: "ㄔ", long_click: "ㄘ"}
- {click: "ㄨ", long_click: ""}
- {click: "ㄛ", long_click: ""}
- {click: "ㄟ", long_click: ""}
- {click: "ㄢ", long_click: ""}
- {click: "ㄤ", long_click: ""}
#line3
- {click: "ㄈ", long_click: ""}
- {click: "ㄐ", long_click: "ㄑ"}
- {click: "ㄒ", long_click: ""}
- {click: "ㄕ", long_click: "ㄙ"}
- {click: "ㄩ", long_click: ""}
- {click: "ㄜ", long_click: "ㄝ"}
- {click: "ㄠ", long_click: ""}
#line4
- {click: "ㄖ", long_click: ""}
- {click: "ㄦ", long_click: ""}
```

由于[Rime 注音輸入方案](https://github.com/rime/rime-bopomofo)依赖`zhuyin.yaml`对[地球拼音](https://github.com/rime/rime-terra-pinyin)词典`terra_pinyin.dict.yaml`的转换，导致更改键位进行输入不可行。因此需重建词库。即有，建立汉语拼音词库、建立汉语注音词库。

1. 字库，保证输入字的全面性。
2. 词库，保证输入词的筛选性和快速性。

据[CJK-character-count](https://github.com/NightFurySL2001/CJK-character-count)，统一码区（康熙部首、部首补充、〇、CJK表意文字至G区）共有92866字符。

以3type的[glyphs-han](https://github.com/3type/glyphs-han)码表为基础。