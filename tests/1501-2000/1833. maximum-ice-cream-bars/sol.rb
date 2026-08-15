# @param {Integer[]} costs
# @param {Integer} coins
# @return {Integer}
def max_ice_cream(costs, coins)
    x_min = x_max = costs.max
    freq = Array.new(x_max + 1, 0)
    costs.each do |x|
        freq[x] += 1
        x_min = [x_min, x].min
    end
    cnt = 0
    (x_min..x_max).each do |x|
        f = freq[x]
        next if f == 0
        buy = [coins / x, f].min
        break if buy == 0
        cnt += buy
        coins -= buy * x
    end
    cnt
end
