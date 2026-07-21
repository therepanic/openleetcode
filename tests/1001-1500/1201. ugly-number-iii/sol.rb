# @param {Integer} n
# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {Integer}
def nth_ugly_number(n, a, b, c)
    def gcd(x, y)
        while y != 0
            x, y = y, x % y
        end
        x
    end
    
    def lcm(x, y)
        x * y / gcd(x, y)
    end
    
    ab = lcm(a, b)
    ac = lcm(a, c)
    bc = lcm(b, c)
    abc = lcm(ab, c)
    
    count = lambda do |x|
        x / a + x / b + x / c - x / ab - x / ac - x / bc + x / abc
    end
    
    left = 1
    right = 2 * 10**9
    
    while left < right
        mid = (left + right) / 2
        if count.call(mid) >= n
            right = mid
        else
            left = mid + 1
        end
    end
    
    left
end
