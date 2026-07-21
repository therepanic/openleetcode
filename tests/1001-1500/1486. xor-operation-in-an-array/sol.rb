# @param {Integer} n
# @param {Integer} start
# @return {Integer}
def xor_operation(n, start)
    ans = 0
    while n > 0
        ans ^= start
        start += 2
        n -= 1
    end
    ans
end
