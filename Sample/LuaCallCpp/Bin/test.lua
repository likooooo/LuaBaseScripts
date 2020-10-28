local dll = require "CppLibForLua"
--print(dll.add(1,2))
res = dll.ShowMsgBox('clicked count:0')
loopCount = 1;
while(res ~='clicked cancel button')
do
   print(res)
   res = dll.ShowMsgBox('clicked count:' .. loopCount)
   loopCount = loopCount + 1
end
print(res)