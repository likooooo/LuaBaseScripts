--Lua 错误处理

--assert自定义错误提示
local function add(a,b)
    assert(type(a) == "number", "a  is not number type")
    assert(type(b) == "number", "b is not number type")
    return a+b
 end
--  add(10)

 --[[
    pcall以一种"保护模式"来调用第一个参数，因此pcall可以捕获函数执行中的任何错误。
    通常在错误发生时，希望落得更多的调试信息，而不只是发生错误的位置。但pcall返回时，它已经销毁了调用桟的部分内容。
    Lua提供了xpcall函数，xpcall接收第二个参数——一个错误处理函数，当错误发生时，Lua会在调用桟展开（unwind）前调用错误处理函数，于是就可以在这个函数中使用debug库来获取关于错误的额外信息了。
    debug库提供了两个通用的错误处理函数:
        debug.debug：提供一个Lua提示符，让用户来检查错误的原因
        debug.traceback：根据调用桟来构建一个扩展的错误消息
 --]]

 --erro
 --[[
    Level=1[默认]：为调用error位置(文件+行号)
    Level=2：指出哪个调用error的函数的函数
    Level=0:不添加错误位置信息
--]]
--error ('fd',0)
--error ('dsa',1)
--error ('fdsa',2)

--pcall
 isSucess,retVal = pcall(add, 1)
--print(isSucess,retVal)
if isSucess then
    print("[sucess]",retVal)-- 没有错误
else
    print("[fail]")-- 一些错误
end
isSucess,retVal = pcall(add, 1,1)
if isSucess then
    print("[sucess]",retVal)-- 没有错误
else
    print("[fail]")-- 一些错误
end

--xpcall
function myfunction ()
    n = n/nil
 end
 
 function myerrorhandler( err )
    print( "[log][ERROR][ERROR][ERROR][ERROR][ERROR]", err )
 end
 
 status = xpcall( myfunction, myerrorhandler )
if(status)then
    print("[sucess]")
else
    print("[fail]")
end

-- function myerrorhandler( err )
--     print( "ERROR:", err )
--  end
 
--  status = xpcall( myfunction, myerrorhandler )
--  print( status)