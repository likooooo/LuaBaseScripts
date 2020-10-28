--数学计算的lua库
Math ={}

--加
function Math.Add(left,right)
    return left + right
end
--减
function Math.Sub(left,right)
    return left - right
end
--乘
function Math.Mult(left,right)
    return left * right
end
--除
function Math.Division(left,right)
    return left / right
end
--取余
function Math.Remainder(left,right)
    return left % right
end
--n次幂
function Math.Dim(d,n)
    return d^n
end
--倒置
function Math.Invert(d)
    return -d
end

function Math.Equal(left,right)
    return left == right
end
function Math.NoEqual(left,right)
    return left ~= right
end
function Math.GreaterThan(left,right)
    return left > right
end
function Math.LessThan(left,right)
    return left < right
end
function Math.GreaterThanOrEqual(left,right)
    return left >= right
end
function Math.LessThanOrEqual(left,right)
    return left <= right
end
--sample
print(Math.Dim(2,8))

return Math;
