# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def sum_base(n, k)
    total = 0
    while n > 0
        total += n % k
        n /= k
    end
    total
end
