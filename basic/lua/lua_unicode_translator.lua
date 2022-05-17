--[[
    lua_unicode_translator
    unicode码翻译器
    
    2022年5月4日  Shitlime
    
    
    
    使用方法：
    1.在rime.lua添加如下1行
    
    lua_unicode_translator = require("lua_unicode_translator")--unicode翻译器
    
]]--

local function U2C(value)    --unicode码hex转换成字符
    local str
    value = tonumber(value, 16)
    -- 先把Unicode二进制值转成Utf_8格式， 再用string.char返回字符
    if value < 128 then -- （Utf_8格式 = [0xxxxxxx]）（128 = 10000000）
        str = string.char(value)
    elseif value < 2048 then -- （Utf_8格式 = [110xxxxx]-[10xxxxxx]） (2048 = 1000 00000000）
        local byte1 = 128 + value % 64
        local byte2 = 192 + math.floor(value / 64)
        str = string.char(byte2, byte1)
    elseif value < 65536 then -- (Utf_8格式 = [1110xxxx]-[10xxxxxx]-[10xxxxxx]) (65536 = 1 00000000 00000000)
        local byte1 = 128 + value % 64
        local byte2 = 128 + (math.floor(value / 64) % 64)
        local byte3 = 224 + (math.floor(value / 4096) % 16)
        str = string.char(byte3, byte2, byte1)
    elseif value < 2097152 then -- (Utf_8格式 = [11110xxx]-[10xxxxxx]-[10xxxxxx]-[10xxxxxx])
        local byte4 = value % 0x40 + 0x80
        local byte3 = math.floor(value / 0x40) % 0x40 + 0x80
        local byte2 = math.floor(value / 0x1000) % 0x40 + 0x80
        local byte1 = math.floor(value / 0x40000) % 0x8 + 0xf0
        str = string.char(byte1, byte2, byte3, byte4)
    end
    return str
end

function lua_unicode_translator(input, seg)
        local char = U2C(input)
        if char == '\n' then --解决显示\n闪退的问题
            char = '\r'
        end
        yield(Candidate("Unicode", seg.start, seg._end, char, "Unicode"))
end

return lua_unicode_translator