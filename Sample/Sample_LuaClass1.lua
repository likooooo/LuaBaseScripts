local m = require("Sample_LuaClass")

function Sleep(n)
    if n > 0 then os.execute("ping -n " .. tonumber(n + 1) .. " localhost > NUL") end
end
 
loopCount = 0
while(loopCount<10)
do
    m.SetName("   ")
    loopCount = loopCount + 1
    Sleep(1)
end