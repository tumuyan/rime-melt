local oo_state = require("melt_oo_state")

-- 查询 oo/ii 变量值
local function oo_translator(input, seg, env)
  if input == "oo" and string.len(oo_state.history_oo) > 0 then
    yield(Candidate("oo", seg.start, seg._end, oo_state.history_oo, "get oo"))
  elseif input == "ii" and string.len(oo_state.history_ii) > 0 then
    yield(Candidate("oo", seg.start, seg._end, oo_state.history_ii, "get ii"))
  end
end

return oo_translator