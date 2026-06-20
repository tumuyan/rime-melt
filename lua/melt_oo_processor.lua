local oo_state = require("melt_oo_state")

-- 包含2个功能，输入 值=oo 设置 history_oo，输入数字完成长候选词取值上屏
local function oo_processor(key, env)
  local context = env.engine.context
  local commit_text = context:get_commit_text()
  if commit_text == nil then
    return 2
  end
  
  local ch = key.keycode
  local done = false
  
  if context:has_menu() then
    if key.keycode == 32 then
      done = true
    elseif ch < 58 and ch > 48 then
      if next(oo_state.oo_buffer) == nil then
        return 2
      end
      local composition = context.composition
      local segment = composition:back()
      local index = segment.selected_index + ch - 49
      local candidate_count = segment.menu:candidate_count()
      if candidate_count <= index or index < 0 then
        return 2
      end
      commit_text = segment:get_candidate_at(index).text
      if oo_state.oo_buffer[commit_text] ~= nil then
        done = true
      end
    end
    if done then
      if string.len(commit_text) > 80 and oo_state.oo_buffer[commit_text] ~= nil then
        context:clear()
        env.engine:commit_text(oo_state.oo_buffer[commit_text])
        return 1
      end
      if string.match(commit_text, "^[%w%p]+$") ~= nil then
        context:clear()
        env.engine:commit_text(commit_text)
        return 1
      end
    end
  end

  local v = commit_text:match("(.+)=")
  local k = context.input:match("=(.+)$")
  if k == nil or v == nil then
    return 2
  end
  
  if k == "oo" then
    oo_state.history_oo = v
    context:clear()
    return 1
  elseif k == "ii" then
    oo_state.history_ii = v
    context:clear()
    return 1
  end
  return 2
end

return oo_processor