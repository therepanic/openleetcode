# @param {Integer} p
# @return {Integer}
def min_non_zero_product(p)
    mod = 10**9 + 7
    max_num = (1 << p) - 1
    count = (1 << (p - 1)) - 1
    
    pow_mod = ->(x, n) {
        result = 1
        x %= mod
        while n > 0
            result = (result * x) % mod if n & 1 == 1
            x = (x * x) % mod
            n >>= 1
        end
        result
    }
    
    (pow_mod.call(max_num - 1, count) * max_num) % mod
end
