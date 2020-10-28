local tblHelper =  dofile("TableHelper.lua")   --加载并编译运行脚本 ,类似于实例化TableHelper类

--创建二维数组，width,height,分别为二维数组宽度和高度
function CreateMap(width,height,initVal) 
  array = {}
    for r = 1, height do
        array[r] = {}
        for c = 1, width do
            array[r][c] = initVal
        end
    end
    return array
end

--打印二维数组
function PrintMap(map,width,height) 
    for r = 1, height do
      print('##############当前执打印至第 '..r..' 行，数据宽度：'..#map[r]..' ##############')
      --PrintTable(map[r])
      PrintTableWidthIndex(map[r])
    end
end

map = CreateMap(10,5,100)
PrintMap(map,10,5)

print('load [MapHelper.lua] sucess')