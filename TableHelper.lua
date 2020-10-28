--实现table的控制
function RemoveAt(source, index) 
  --source.remove(index)
  table.remove(source,index)
end

--指定pos插入val
function Insert(source, pos,val) 
  table.insert (source, pos, val)
end
	

--实现table的打印,前者同时打印index，后者仅打印值
function PrintTableWidthIndex(source)
  for k,v in ipairs(source) do
    print(k,v)
  end
end

function PrintTable(source)
  for k,v in ipairs(source) do
      print(v)
  end
end
--[[
list = {1,2,3,4,5}
PrintTable(list)
RemoveAt(list,1)
PrintTableWidthIndex(list)
]]--
print('load [TableHelper.lua] sucess')