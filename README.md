# 融合拼音(rime_melt)
融合了[【袖珍简化字拼音】](https://github.com/rime/rime-pinyin-simp/)[【Rime 简体中文用户定制文件】](https://github.com/huaxianyan/Rime)和【Easy English】以实现中英文混合输入，故名[融合拼音(rime_melt)](https://github.com/tumuyan/rime-pinyin-simp)。   
Rime新手使用此方案，可以快速上手简体中文和常用英语的混合输入。

## 意义 
* 众所周知，拼音输入是使用人数最多的中文输入方式；而rime默认拼音方案为明月拼音，该方案使用了繁体词库，通过OpenCC转换繁体中文为简体，而转换的结果事实上并不理想。故使用简体字典输入中文是很有必要的。
* 本方案使用的英文词库与Easy English词汇量差异极大，只保留了较常用的词汇，并非单纯为了提高混打中英文时的打字速度，而是借用字典机制对输入的单词的正确性和大小写进行校对。基于@tanzi制作的包含2016考研词汇大纲和六级单词词库进行更新，故更名为Easy English Nano。
* 如果你已经安装Easy English方案，与本方案互不影响。
* 如果你已经安装袖珍简化拼音，但是没有修改对应的custom文件，那么既可以选择使用本方案的文件替换冲突的文件，也可以选择保留原有文件，两者基本没有大的差别。   

## 使用方法
* 目前本方案没有加入东风破，需要下载文件并放置到方案目录来使用。 
1. [下载文件](https://github.com/tumuyan/rime-pinyin-simp/archive/master.zip)、解压文件并复制到`Rime用户文件夹`内。用户文件夹位置：  
    * 【中州韻】 ~/.config/ibus/rime/ （0.9.1 以下版本爲 ~/.ibus/rime/）
    * 【小狼毫】 %APPDATA%\Rime
    * 【鼠鬚管】 ~/Library/Rime/
2. 启用 [袖珍简化字拼音] 和 [Easy English Nano] 方案。
3. 打开 Rime 方案选单（输入状态下按Ctrl + ~），切换至 [融合拼音] 即可开始使用。


## 注意事项
* Easy English Nano方案内置了大小写转换，允许用小写字母输入拼大小写混合的单词，允许首字母大写输入全大写的单词。（也就是说，首字母大写不能输入全小写的单词）因此在维护词典时，无需手动对大小写的词条做编码优化即可得到较好的体验，词条和编码完全一致即可。
* Easy English Nano方案能够自动处理编码中的单个+-_符号。如果词条包含了其他符号或多个符号，比如空格，需要手动去除特殊符号。
* 部分单词拼写存在英式英语和美式英语的差别，以符合国内（其实是本人）拼写习惯。通过核查，多数单词实际上是美式拼写习惯，少部分为英式，也有少部分保留了两种拼写。此部分改动并未完全落实。  
    使用美式的有如下参考规律：  

    |拼写规律|例词1|例词2|   
    | :----: | :----: | :----: |  
    | 英式our，美式写成or, 选择美式 | colour **color** | favourite **favorite**  |  
    | 英式词尾me/ue不发音，美式删掉 | kilogramme **kilogram** |catalogue **catalog** |  
    | 英式中的ise结尾，美式改成ize | apologise **apologize** | recognise **recognize** |  
    | 英式的re和美式的er | theatre **theater** | centre **center** |  
    | 英式的ce和美式的se | licence **license** |  |    
  
    
    选用英式英语的例子：  
    - railway 是英式英语，railroad是美式英语，使用railway  



* 输入的英语不会生成自造词（我认为这是一个好的特性，避免了输入错误造成的字典污染）


## 文件组成及授权

[【袖珍简化字拼音】](https://github.com/rime/rime-pinyin-simp/)项目使用**Apache 2.0**协议，涉及的文件包含：  
* `pinyin_simp.dict.yaml` ：袖珍简化字拼音词库文件。此文件仅用于和原方案词库对比差异、保持同步，可直接删除  
* `pinyin_simp.schema.yaml` ：袖珍简化字拼音方案文件。仅用于数据合并和同步，实际未在使用。  
上游更新：2020-11-9 23:00    

[【Rime 简体中文用户定制文件】](https://github.com/huaxianyan/Rime)项目使用**MIT**协议，涉及的文件包含：
- `pinyin_simp.custom.yaml` ：袖珍简化字拼音方案的客制化配置文件。
- `pinyin_simp.main.dict.yaml` ：词库中心文件。词库内容由 [袖珍简化字拼音](https://github.com/rime/rime-pinyin-simp) 默认词库pinyin_simp.dict.yaml修改而来，故合并两者并保持同步。
- `pinyin_simp_base.dict.yaml` ：基础词库，由额外词库文件引用使用，来源为项目 [https://github.com/alswl/Rime](https://github.com/alswl/Rime) 中的[「现代汉语常用词表」](https://raw.githubusercontent.com/alswl/Rime/master/luna_pinyin.xiandaihanyuchangyongcibiao.dict.yaml)。
- `cn_en.dict.yaml` ： 弃用，改为引用Easy English Nano方案输入英文。
- `zhwiki.dict.yaml` ：肥猫词库。来源为项目 [fcitx5-pinyin-zhwiki](https://github.com/felixonmars/fcitx5-pinyin-zhwiki)  。原项目的词库文件较旧，本fork分支会不定期从肥猫词库的release页面下载并更新。
更新：zhwiki-20210401.dict.yaml  
    
以下词库仅保持结构，实际上并没有在维护，由最终用户根据实际需求来编辑：  
- `pinyin_simp_custom.dict.yaml` ：自定义词语，由额外词库文件引用使用。如需添加自定义短语，建议编辑此文件。
- `pinyin_simp_pin.txt` ：候选固定，使用另一个翻译器并给极高权重来达到固定候选列表的目的，编辑时请记得给极高权重。

【Easy English Nano】
* `melt_eng.schema.yaml` 归属于【Easy English】，原作者是Patrick <ipatrickmac@gmail.com>，但是在Patrick的主页没有这个项目的仓库。
而github上[BlindingDark](https://github.com/BlindingDark/rime-easy-en)有在维护，使用了**LGPLv3**协议，但是与本方案分属不同分支。
* `melt_eng.dict.yaml` 英文主词库，作者tanzi，没有更多信息。在2016考研词汇大纲和六级单词的基础上进行修订。
* `melt_mult_language.dict.yaml`中英混合及其他语言的词库。

【融合拼音增补词库】  
求人不如求己，用[【深蓝词库转换】](https://github.com/studyzy/imewlconverter)转换搜狗细胞词库，并手动更新。（然而显而易见，搜狗目前的策略并不是通过更新离线词库来改善用户的输入体验，聊胜于无罢了）
- `pinyin_simp_chengyu.dict.yaml`：搜狗成语俗语细胞词库 https://pinyin.sogou.com/dict/detail/index/15097   
更新：2017-03-30 20:46:10
- `pinyin_simp_gushi.dict.yaml`：搜狗古诗细胞词库 https://pinyin.sogou.com/dict/detail/index/2  
更新：2020-12-28 15:05:44

【融合拼音参考文件】  
- `/others/*.csv`: 整理中的增补字典，除常见国家和语言外均未实装。可直接删除  

**Note**：以上文件清单仅供参考，存在仓库增加了文件，但是本说明没有及时更新的情况。  


## 其他

<details>
<summary>以下内容来自袖珍简化字拼音的Readme和Rime项目Wiki</summary>

# 袖珍简化字拼音

配方： ℞ **pinyin-simp**

[Rime](https://rime.im) 袖珍简化字拼音輸入方案

## 安裝

[東風破](https://github.com/rime/plum) 安裝口令： `bash rime-install pinyin-simp`

授權條款：見 [LICENSE](LICENSE)


# [Rime说明书](https://github.com/rime/home/wiki/UserGuide)   
## 使用快捷键

- 设置：在Rime输入状态下，按  `F4`  鍵或組合鍵  ``Ctrl+` ``  喚出輸入方案選單（`` ` ``  鍵常見於  `1`  的左方），可以进入输入方案及选项设置。
使用 ←→鍵 定位光標插入點「‸」（或顯示爲「›」），編輯輸入碼。 也可用來縮短後選詞所對應輸入碼的範圍、確認詞句的一部分。
- 光标：
`Home`、`End`  鍵 快速跳至句首、句末。
`BackSpace`、`Delete`  鍵 分別刪除光標前、後的編碼字符。注意在蘋果鍵盤上前者標註爲  `Delete`，後者通常是組合鍵  `Fn+Delete`。
`Escape`  鍵 清空未完成的輸入。

- 刪除誤上屏的錯詞：先把選字光標（用上、下鍵）移到要刪除的用戶詞組上，再按下  `Shift+Delete`  或  `Control+Delete`（蘋果鍵盤用  `Shift+Fn+Delete`）。 
这个操作只能從用戶詞典中刪除詞組。用於碼表中原有的詞組時，只會取消其調頻效果。

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
