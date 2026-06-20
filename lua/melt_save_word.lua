local helpers = require("melt_helpers")

-- 获取用户数据目录（%APPDATA%\Rime）
local function getUserDataDir()
  if rime_api and rime_api.get_user_data_dir then
    return rime_api:get_user_data_dir()
  end
  -- fallback（极少需要）
  return helpers.getCurrentDir()
end

-- 保存词条到英文用户词库
-- 末尾加一个 - 显示保存提示，加两个 -- 直接保存到 melt_eng_custom.dict.yaml
local function save_word(input, seg, env)
  if string.sub(input, -1) == "-" then
    -- 跳过 date/time 特定格式，由 melt_quick 处理
    if input ~= "date-" and input ~= "time--" and input ~= "time-" and input ~= "date--" then
      local inpu = string.gsub(input, "[-]+$", "")
      if string.len(inpu) > 1 and string.sub(input, 1, 1) ~= "-" then
        if string.sub(input, -2) == "--" then
          local ppath = getUserDataDir() .. "\\melt_eng_custom.dict.yaml"
          local file = io.open(ppath, "a")
          file:write("\n" .. inpu .. "\t" .. inpu .. "\t100")
          file:close()
          yield(Candidate("pin", seg.start, seg._end, inpu, " 已保存"))
        else
          yield(Candidate("pin", seg.start, seg._end, inpu, " -保存"))
        end
      end
    end
  end
end

return save_word