# @param {Integer} n
# @param {Integer} a
# @param {Integer} b
# @return {Integer}
def nth_magical_number(n, a, b)
    mod = 1000000007
    g = a.gcd(b)
    lcm = a / g * b
    lo = [a, b].min
    hi = n * lo
    while lo < hi
        mid = (lo + hi) >> 1
        cnt = mid / a + mid / b - mid / lcm
        if cnt < n
            lo = mid + 1
        else
            hi = mid
        end
    end
    lo % mod
end
