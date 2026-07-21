# @param {Integer} n
# @return {Integer}
def count_orders(n)
    mod = 10**9 + 7
    count = 1
    (2..n).each do |i|
        count = (count * (2 * i - 1) * i) % mod
    end
    count
end
