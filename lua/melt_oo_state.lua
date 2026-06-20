-- oo/ii 共享可变状态
-- 通过 require 共享同一份 table，让 oo_filter 和 oo_processor 数据互通
local M = {
  history_oo = "",
  history_ii = "",
  oo_buffer = {},
}

return M