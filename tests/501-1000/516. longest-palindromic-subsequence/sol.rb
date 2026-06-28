# @param {String} s
# @return {Integer}
def longest_palindrome_subseq(s)
    n = s.length
    dp = Array.new(n) { Array.new(n, 0) }
    (n - 1).downto(0) do |i|
        dp[i][i] = 1
        (i + 1...n).each do |j|
            if s[i] == s[j]
                dp[i][j] = dp[i + 1][j - 1] + 2
            else
                dp[i][j] = [dp[i + 1][j], dp[i][j - 1]].max
            end
        end
    end
    dp[0][n - 1]
end
