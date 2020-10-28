local dll = require "CppLibForLua"
--print(dll.add(1,2))
res = dll.ShowMsgBox('fdsafdsafds')
loopCount = 0;
while(res ~='clicked cancel button')
do
   print(res)
   res = dll.ShowMsgBox(loopCount)
   loopCount = loopCount + 1
end
print(res)