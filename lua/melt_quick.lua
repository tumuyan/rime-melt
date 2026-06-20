local helpers = require("melt_helpers")

-- 快捷输入：输出日期、时间、UUID
local function quick_input(input, seg, env)
  if input == "guid" or input == "uuid" then
    yield(Candidate("UUID", seg.start, seg._end, helpers.guid(), " -V4"))
  elseif input == "date" then
    yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), " -"))
  elseif input == "time" or input == "date---" then
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), " -"))
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), " -"))
    yield(Candidate("time", seg.start, seg._end, os.date("%H%M%S"), " -"))
  elseif string.sub(input, -1) == "-" then
    if input == "date-" or input == "time--" then
      yield(Candidate("date", seg.start, seg._end, os.date("%m/%d"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y.%m.%d"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%B %d"), ""))
      yield(Candidate("date", seg.start, seg._end, string.gsub(os.date("%Y年%m月%d日"), "([年月])0", "%1"), ""))
    elseif input == "time-" or input == "date--" then
      yield(Candidate("date", seg.start, seg._end, os.date("%m/%d %H:%M"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d %H:%M"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y.%m.%d %H:%M"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d%H%M%S"), ""))
      yield(Candidate("date", seg.start, seg._end, os.date("%B %d %H:%M"), ""))
      yield(Candidate("date", seg.start, seg._end, string.gsub(os.date("%Y年%m月%d日 %H:%M"), "([年月])0", "%1"), ""))
      yield(Candidate("date", seg.start, seg._end, os.time(), "-秒"))
    end
  end
end

return quick_input