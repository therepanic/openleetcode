# @param {Integer} n
# @param {Integer} min_profit
# @param {Integer[]} group
# @param {Integer[]} profit
# @return {Integer}
def profitable_schemes(n, min_profit, group, profit)
    mod = 10**9 + 7
    dp = Array.new(n + 1) { Array.new(min_profit + 1, 0) }
    dp[0][0] = 1
    (1..group.length).each do |k|
        g = group[k - 1]
        p = profit[k - 1]
        (n).downto(g) do |i|
            (min_profit).downto(0) do |j|
                dp[i][j] = (dp[i][j] + dp[i - g][[0, j - p].max]) % mod
            end
        end
    end
    (0..n).sum { |i| dp[i][min_profit] } % mod
end
