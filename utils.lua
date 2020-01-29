--[[
  || Small utility functions
--]]

local path    = require "path"
      path.fs = require "path.fs"

local delim = package.config:sub (1,1)

local utils = {}

-- Iterator over lines of <str>
function utils.ilines (str)
  str = (str:sub (-1) ~= "\n") and (str .. "\n") or str
  return str:gmatch ("(.-)\n")
end

-- Test if <val> exists as a value in <tbl>
function utils.isValueInTable (tbl, val)
  for _dummy, valTbl in pairs (tbl) do
    if (valTbl == val) then
      return true
    end
  end
  return false
end

-- Test if <dir> is an existing directory
-- If error occurs, refer to <dir> as <errname>
-- If <dir> does not exist, and <nice> is true, try to create <dir>
function utils.isAvailableDirectory (dir, errname, nice)
  local typeDir, errStat = path.fs.type (dir)
  if not typeDir then
    if not nice then
      error (string.format (
        "Checking %s failed!\n" ..
        "%s",
        errname, errStat
      ), 3)
    else
      handlerWarn (string.format (
        "Checking %s failed.\n" ..
        "%s",
        errname, errStat
      ))
      handlerWarn (string.format (
        "Attempt to mkdir %s.",
        errname
      ))
      local successMk, errMk = path.fs.makedirs
      if not successMk then
        error (string.format (
          "Failed to mkdir %s!\n" ..
          "%s",
          errname, errMk
        ), 3)
      end
    end
  elseif (typeDir ~= "dir") then
    error (string.format (
      "%s is not a directory (type '%s')!",
      errname, typeDir
    ), 3)
  end
end

function utils.assurePathDelimiter (somepath)
  return (somepath:sub (-1) ~= delim and (somepath .. delim) or somepath)
end

return utils
