# @param {Integer[]} stones
# @return {Integer}
def last_stone_weight_ii(stones)
    n = stones.length
    total = stones.sum
    target = total / 2
    dp_prev = Array.new(target + 1, 0)
    (n - 1).downto(0) do |i|
        dp_curr = Array.new(target + 1, 0)
        (0..target).each do |size|
            skip = dp_prev[size]
            take = size >= stones[i] ? dp_prev[size - stones[i]] + stones[i] : -Float::INFINITY
            dp_curr[size] = [skip, take].max
        end
        dp_prev = dp_curr
    end
    total - 2 * dp_prev[target]
end
