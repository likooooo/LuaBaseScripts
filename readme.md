--当前目录下的脚本为lua基础数据处理的脚本，作为学习lua的输出结果
--lua.exe实在vs2008的环境下编译win32的lua解释器
--例程
--1.Helloword
--Sample/LuaCallCpp     --将win32的msgbox封装成lua可调用的dll,在test.lua中运行=>.\Sample\LuaCallCpp\Bin\Lua.exe .\Sample\LuaCallCpp\Bin\test.lua
--2.关键字local
--Sample/Sample_variable.lua    --变量的定义=> .\Lua.exe .\Sample\Sample_variable.lua
--3.for循环的几种用法
--Sample/Sample_LuaClass1.lua   --.\Sample\Lua.exe .\Sample\Sample_LuaClass1.lua
--4.计算代码执行的时间 调用os.clock();
--Sample/Sample_RecordTime.lua  --.\Lua.exe .\Sample\Sample_RecordTime.lua
--5.Lua 元表(Metatable)
--Sample/Sample_Metatable.lua   --.\Lua.exe .\Sample\Sample_Metatable.lua
--6.Lua协程（线程）
--Sample/Sample_coroutine.lua   --用Lua协程实现购买问题=>.\Lua.exe .\Sample\Sample_coroutine.lua   
--7.Lua 错误处理 
--Sample/Sample_LuaHandleErroMsg.lua   --.\Lua.exe .\Sample\Sample_LuaHandleErroMsg.lua   
-8.Lua 调试(Debug)
--Sample/Sample_Debug.lua       --.\Lua.exe .\Sample\Sample_Debug.lua  
-8.Lua 垃圾回收
--Sample/Sample_collectgarbage .lua     --.\Lua.exe .\Sample\Sample_collectgarbage .lua  
