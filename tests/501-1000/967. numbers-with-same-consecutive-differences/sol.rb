# @param {Integer} n
# @param {Integer} k
# @return {Integer[]}
def nums_same_consec_diff(n, k)
    res = (1..9).to_set
    n -= 1
    
    while n > 0
        res.to_a.each do |val|
            res.delete(val)
            last = val % 10
            if last + k < 10
                res.add(val * 10 + last + k)
            end
            if last - k >= 0
                res.add(val * 10 + last - k)
            end
        end
        n -= 1
    end
    
    res.to_a
end
