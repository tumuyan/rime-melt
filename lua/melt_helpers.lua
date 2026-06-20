-- 获取用户目录
local function getCurrentDir()
  function sum(a, b)
    return a + b
  end
  local info = debug.getinfo(sum)
  local path = info.source
  path = string.sub(path, 2, -1) -- 去掉开头的"@"
  path = string.match(path, "^(.*[\\/])") -- 捕获目录路径
  local spacer = string.match(path,"[\\/]")
  path=string.gsub(path,'[\\/]',spacer)  .. ".." .. spacer 
  return path
end

function guid()
    local seed={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'}
    local tb={}
    for i=1,32 do
        table.insert(tb,seed[math.random(1,16)])
    end
    local sid=table.concat(tb)
    return string.format('%s-%s-%s-%s-%s',
        string.sub(sid,1,8),
        string.sub(sid,9,12),
        string.sub(sid,13,16),
        string.sub(sid,17,20),
        string.sub(sid,21,32)
    )
end

-- 获取子字符串。根据UTF8编码规则，避免了末位输出乱码
local function get_sub_string(str, length)
  if string.len(str)<length then
    return str
  end

  local ch = string.byte(str, length)
  while( ch<=191 and ch >= 128)
  do
    length = length-1
    ch = string.byte(str, length)
  end
  return string.sub(str,1,length-1)
end

-- Windows 小狼毫输出\r\n会崩溃，故需判断系统为Windows则只输出\r
local next_line = "\n"
if package.config:sub(1,1) == "\\" then
  next_line = "\r"
end

return {
  getCurrentDir = getCurrentDir,
  guid = guid,
  get_sub_string = get_sub_string,
  next_line = next_line,
}