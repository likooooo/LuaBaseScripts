require("EnumHelper.lua")

key = {
  readOnly, --以只读方式打开文件，该文件必须存在。
  writeOnly,--打开只写文件，若文件存在则文件长度清为0，即该文件内容会消失。若文件不存在则建立该文件。
  append,   --文件可读可写,以附加的方式打开只写文件。若文件不存在，则会建立该文件，如果文件存在，写入的数据会被加到文件尾，即文件原先的内容会被保留。（EOF符保留）
  readwrite --以可读写方式打开文件，该文件必须存在。
}

--+代表可读可写，没有则仅代表其自身操作
val = {
  'r',
  'w',
  'a+',
  'r+'
}
Enum_IO_Operate = CreateEnumTable(key,val)
fileHandle = {}

function LoadFile(filepath)
  file = io.open(filepath, key.readOnly)
  table.insert(fileHandle,#fileHandle,file)
  return file
end

function CreateFile(filepath)
  file = io.open(filepath, key.writeOnly)
  table.insert(fileHandle,#fileHandle,file)
  return file
end

function AppendFile(filepath)
  file = io.open(filepath, key.append)
  table.insert(fileHandle,#fileHandle,file)
  return file
end

--释放指定文件句柄
function Dispose(file)
  io.close(fileHandle)
  table.remove(fileHandle,file)
end

--释放所有文件句柄
function DisposeAll()
  io.close(fileHandle)
  idx = 1
  while(idx<=#fileHandle)
    io.close(fileHandle[idx])
    idx = idx + 1
    table.remove(fileHandle,1)
  end
end

print('load [FleStreamHelper.lua] sucess')