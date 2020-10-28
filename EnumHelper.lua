--在Lua中定义枚举
--tbl表类型，储存着枚举名称
--index，定义枚举值自增的初始值
function CreatEnumTable(tbl, index) 
    local enumtbl = {} 
    local enumindex = index or 0 
    for i, v in ipairs(tbl) do 
        enumtbl[v] = enumindex + i 
    end 
    return enumtbl 
end 



--sample
EnumTable = 
{ 
    "ET1", 
    "ET2", 
}

EnumTable = CreatEnumTable(EnumTable,0) 
print(EnumTable.ET1) 
print(EnumTable.ET2)