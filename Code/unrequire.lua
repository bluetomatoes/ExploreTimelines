
local M = {}




local unrequire = function(m)
package.loaded[m] = nil
_G[m] = nil
end

M.unrequire = unrequire


return M