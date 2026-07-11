# @param {Integer[]} values
# @return {Integer}
def min_score_triangulation(values)
    n = values.length
    dp = Array.new(n) { Array.new(n, 0) }
    (n - 1).downto(0) do |i|
        (i + 1...n).each do |j|
            min_val = Float::INFINITY
            (i + 1...j).each do |k|
                val = dp[i][k] + values[i] * values[k] * values[j] + dp[k][j]
                min_val = val if val < min_val
            end
            dp[i][j] = min_val if min_val != Float::INFINITY
        end
    end
    dp[0][n - 1]
end
