# @param {Integer[][]} cost
# @return {Integer}
def connect_two_groups(cost)
    m = cost.length
    n = cost[0].length
    mn = Array.new(n) { |j| (0...m).map { |i| cost[i][j] }.min }
    memo = {}
    fn = lambda do |i, mask|
        key = [i, mask]
        return memo[key] if memo.key?(key)
        if i == m
            res = 0
            (0...n).each do |j|
                res += mn[j] if (mask & (1 << j)) == 0
            end
            memo[key] = res
        else
            res = Float::INFINITY
            (0...n).each do |j|
                val = cost[i][j] + fn.call(i+1, mask | (1 << j))
                res = [res, val].min
            end
            memo[key] = res
        end
    end
    fn.call(0, 0)
end
