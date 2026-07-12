# @param {Integer} k
# @return {Integer}
def smallest_repunit_div_by_k(k)
    if k == 1
        return 1
    end
    
    if k % 2 == 0 || k % 5 == 0
        return -1
    end
    
    rem = 0
    (1..k).each do |i|
        rem = (rem * 10 + 1) % k
        if rem == 0
            return i
        end
    end
    
    return -1
end
