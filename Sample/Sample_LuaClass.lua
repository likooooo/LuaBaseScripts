--lua中的"类"
Sample_LuaClass = {}

-- 定义一个私有常量
local name = "private value"
--定义一个public常量
Sample_LuaClass.name = "public value"

--私有函数，打印log字符串
local function PrintLog(text)
    local getTime = '['..os.date("%c")..']' 
    print("[Log]" .. getTime .. text)
end

--public函数，修改名称
function Sample_LuaClass.SetName(text)
    PrintLog("[class name changed]"..text)
end
 
return Sample_LuaClass