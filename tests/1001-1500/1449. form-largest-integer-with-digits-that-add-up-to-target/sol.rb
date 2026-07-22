# @param {Integer[]} cost
# @param {Integer} target
# @return {String}
def largest_number(cost, target)
    n = cost.length
    memo = {}
    helper = lambda do |i, c|
        return 0 if c == 0
        return -Float::INFINITY if i == n || c < 0
        key = [i, c]
        return memo[key] if memo.key?(key)
        res = [helper.call(i + 1, c), 1 + helper.call(i, c - cost[i])].max
        memo[key] = res
        res
    end
    
    e = helper.call(0, target)
    return "0" if e == -Float::INFINITY
    
    s = ""
    while s.length < e
        (9).downto(1) do |j|
            if cost[j-1] <= target && helper.call(0, target - cost[j-1]) == e - s.length - 1
                target -= cost[j-1]
                s += j.to_s
                break
            end
        end
    end
    s
end
