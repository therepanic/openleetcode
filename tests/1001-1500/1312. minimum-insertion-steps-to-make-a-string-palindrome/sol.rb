# @param {String} s
# @return {Integer}
def min_insertions(s)
    n = s.length
    s2 = s.reverse
    dp = Array.new(n + 1) { Array.new(n + 1, 0) }
    (1..n).each do |i|
        (1..n).each do |j|
            if s[i - 1] == s2[j - 1]
                dp[i][j] = 1 + dp[i - 1][j - 1]
            else
                dp[i][j] = [dp[i - 1][j], dp[i][j - 1]].max
            end
        end
    end
    n - dp[n][n]
end
