# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    a = -Float::INFINITY
    b = 0
    c = 0
    prices.each do |p|
        a, b, c = [a, c - p].max, a + p, [c, b].max
    end
    [b, c].max
end
