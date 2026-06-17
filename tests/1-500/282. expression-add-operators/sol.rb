# @param {String} num
# @param {Integer} target
# @return {String[]}
def add_operators(num, target)
    n = num.length
    res = []
    
    solve = lambda do |idx, path, curr, prev|
        if idx == n
            if curr == target
                res << path
            end
            return
        end
        
        (idx...n).each do |i|
            break if i > idx && num[idx] == '0'
            s = num[idx..i]
            val = s.to_i
            if idx == 0
                solve.call(i+1, s, val, val)
            else
                solve.call(i+1, path+"+"+s, curr+val, val)
                solve.call(i+1, path+"-"+s, curr-val, -val)
                solve.call(i+1, path+"*"+s, (curr-prev)+(prev*val), prev*val)
            end
        end
    end
    
    solve.call(0, "", 0, 0)
    res
end
