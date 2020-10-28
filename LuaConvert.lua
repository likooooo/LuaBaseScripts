local tblHelper =  dofile("TableHelper.lua")   --加载并编译运行脚本 ,类似于实例化TableHelper类

--字符转换
Convert = {}

--输入的必须为字符串，不然会报错，此处没有检验
function Convert.ToString(...)
    local loopCount = select('#', ...)
    res = ''
    for i = 1 , loopCount do
        local arg = select(i, ...)
        res = res .. arg
    end
    return res
end

-- local enumMap = {15,240}
-- --10进制转16进制，toDepth:数据长度
-- function Convert.ToHex(d,toDepth)
--     res = {}
--     for i = 1 ,toDepth
--     do
--         res[i] = 0
--     end
--     idx = 1
--    -- print(enumMap[1])
--     while(d > 0 and idx <= toDepth)
--     do
--         local enumIdx = toDepth - idx+1
--         local temp = d/enumMap[enumIdx]
--         res[idx] = temp
--         d = d - temp * enumMap[enumIdx]
--         idx = idx + 1
--     end
--     return res
-- end
--sample
print(Convert.ToString(1,2,3,4,5))  --'1','2','3','4','5','6','7'

--hex = Convert.ToHex(255,2)
--PrintTableWidthIndex(hex)
return Convert;