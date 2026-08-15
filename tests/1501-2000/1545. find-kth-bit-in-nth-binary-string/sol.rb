# @param {Integer} n
# @param {Integer} k
# @return {Character}
def find_kth_bit(n, k)
    if n == 1
        return '0'
    end
    
    length = (1 << n) - 1
    mid = (length + 1) / 2
    
    if k == mid
        return '1'
    end
    if k < mid
        return find_kth_bit(n - 1, k)
    end
    
    c = find_kth_bit(n - 1, length - k + 1)
    return c == '0' ? '1' : '0'
end
