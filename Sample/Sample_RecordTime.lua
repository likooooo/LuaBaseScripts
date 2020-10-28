RecordTime ={}
--这里通过调用函数指针执行计时 os.clock() 程序执行了多长时间
--https://blog.csdn.net/qq_33337811/article/details/72301897
function RecordTime.RecordFuncTimeUsed(funcPtr,funcParams)
    local starttime = os.clock();                           --> os.clock()用法
    print(string.format("start time : %.4f", starttime));
    funcPtr(funcParams)
    local endtime = os.clock();                           --> os.clock()用法
    print(string.format("end time   : %.4f", endtime));
    print(string.format("cost time  : %.4f", endtime - starttime));
end
 
local my_FuncPtr = function(param)
    local sum = 0;
    for i = 1, param do
      sum = sum + i;
    end
end

--sample
print('all sum form 1 to 100000000')
RecordTime.RecordFuncTimeUsed(my_FuncPtr,100000000)
print('all sum form 1 to 1000000')
RecordTime.RecordFuncTimeUsed(my_FuncPtr,1000000)

return RecordTime