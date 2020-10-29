--Lua 元表(Metatable)
--[[
        在 Lua table 中我们可以访问对应的key来得到value值，但是却无法对两个 table 进行操作。
    因此 Lua 提供了元表(Metatable)，允许我们改变table的行为，每个行为关联了对应的元方法。
    例如，使用元表我们可以定义Lua如何计算两个table的相加操作a+b。
    当Lua试图对两个表进行相加时，先检查两者之一是否有元表，之后检查是否有一个叫"__add"的字段，若找到，则调用对应的值。"__add"等即时字段，其对应的值（往往是一个函数或是table）就是"元方法"
    有两个很重要的函数来处理元表：
        setmetatable(table,metatable): 对指定 table 设置元表(metatable)，如果元表(metatable)中存在 __metatable 键值，setmetatable 会失败。
        getmetatable(table): 返回对象的元表(metatable)。
    以下实例演示了如何对指定的表设置元表：
--]]

mytable = {};                       -- 普通表
mymetatable = {};                   -- 元表
setmetatable(mytable,mymetatable);  -- 把 mymetatable 设为 mytable 的元表 
getmetatable(mytable);

--__index 元方法
keyAscEnum = {a = 65,b = 66,c = 67,d = 68};
t = setmetatable({}, { __index = keyAscEnum });
print(t.a , 
    t.b, 
    t.c , 
    t.d , 
    t.e
);
--__newindex 元方法
print('###################################################')
mymetatable = {key2 = 'value2'}
mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable })

print(mytable.key1)

mytable.newkey = "add new key"              --不存在newkey,会将newkey保存至mymetatable中
print(mytable.newkey,mymetatable.newkey)

mytable.key1 = "key1's value"               --存在key1,会对mytable.key1赋值
print(mytable.key1,mymetatable.key1)

mytable.key2 = "new key2's value"           --mytable存在key2，赋值成功，但是读取时，不存在
print(mytable.key2,mymetatable.key2)

--为表添加操作符 +  对应的是__add
print('###################################################')
-- -- 计算表中最大值，table.maxn在Lua5.2以上版本中已无法使用
-- -- 自定义计算表中最大键值函数 table_maxn，即计算表的元素个数
-- function table_maxn(t)
--     local mn = 0
--     for k, v in pairs(t) do
--         if mn < k then
--             mn = k
--         end
--     end
--     return mn
-- end

-- 在表mytable后面添加表格
mytable = setmetatable({ 1, 2, 3 }, {
    __add = 
    function(mytable, newtable)
        for i = 1, #newtable 
        do
            table.insert(mytable, #mytable+1,newtable[i])
        end
        return mytable
    end
})

secondtable = {7,5,6}
thirdtable = {'a','s','d'}
mytable = mytable + secondtable
mytable = mytable + thirdtable
for k,v in ipairs(mytable) 
do
    print(v)
end

--[[
     __add 键包含在元表中，并进行相加操作。 表中对应的操作列表如下：(注意：__是两个下划线)
     模式	    描述
    __add	对应的运算符 '+'.
    __sub	对应的运算符 '-'.
    __mul	对应的运算符 '*'.
    __div	对应的运算符 '/'.
    __mod	对应的运算符 '%'.
    __unm	对应的运算符 '-'.
    __concat	对应的运算符 '..'.
    __eq	对应的运算符 '=='.
    __lt	对应的运算符 '<'.
    __le	对应的运算符 '<='.
--]]
-- 一个表格调用另外一个表格
-- 定义元方法__call
print('###################################################')    --中文乱码...
--print('###一个表格调用另外一个表格，自定义调用的逻辑，将idx的值的table作为参数，获取对应的原始数据##')
mytable = setmetatable({10,20,30,40,50,60,70,80,90,100}, {
    __call = function(mytable, idxTable)
        temp = {}
        for idx,val in ipairs(idxTable) 
        do
            temp[idx] = mytable[val]
        end
        return temp;
    end
  }
)
temp = mytable({1,3,5,7})
for idx,val in pairs(temp) do
    print(idx,val)    
end  

--__tostring 元方法
--__tostring 元方法用于自定义tostring方法。
print('###################################################')  --自定义tostring的输出
mytable = setmetatable({ 10, 20, 30 }, {
    __tostring = function(mytable)
        sum = ''
        for k, v in pairs(mytable) do
            sum = sum .. v
            if(k < #mytable)
            then
                sum = sum .. '--'
            end
        end   
        return sum 
    end
  })
  print(mytable)