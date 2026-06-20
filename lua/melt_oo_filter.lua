local helpers = require("melt_helpers")
local oo_state = require("melt_oo_state")

-- 包含3个功能：把Oo转换为变量值, <br>转换为换行, 过长的内容切分并缓存,
-- 在候选栏仅提供预览（节约屏幕空间的同时避免输入法崩溃）
local function oo_filter(input, env)
  oo_state.oo_buffer = {}
  local input_len = string.len(env.engine.context.input)
  
  if string.len(oo_state.history_oo) > 0 then
    for cand in input:iter() do
      local text = string.gsub(cand.text, "<br>", helpers.next_line)
      text = string.gsub(text, "&nbsp", " ")
      local comment = cand.comment
      
      if string.find(text, "Oo") ~= nil then
        text = string.gsub(text, "Oo", oo_state.history_oo)
        if string.len(oo_state.history_ii) > 0 then
          text = string.gsub(text, "Xx", oo_state.history_ii)
        end
        comment = "=" .. oo_state.history_oo
      end
      
      if string.len(text) > 120 then
        local key = helpers.get_sub_string(text, 100)
        oo_state.oo_buffer[key] = text
        yield(Candidate(cand.type, 0, input_len, key, "..." .. comment))
      elseif text ~= cand.text then
        yield(Candidate(cand.type, 0, input_len, text, comment))
      else
        yield(cand)
      end
    end
  else
    for cand in input:iter() do
      local text = cand.text
      if string.len(text) > 110 then
        text = string.gsub(text, "&nbsp", " ")
        local key = helpers.get_sub_string(text, 100)
        text = string.gsub(text, "<br>", helpers.next_line)
        oo_state.oo_buffer[key] = text
        yield(Candidate(cand.type, 0, input_len, key, "..." .. cand.comment))
      else
        yield(cand)
      end
    end
  end
end

return oo_filter