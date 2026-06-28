# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
    n, m = word1.length, word2.length
    dp = Array.new(n + 1) { Array.new(m + 1, 0) }

    (1..n).each do |i|
        (1..m).each do |j|
            if word1[i-1] == word2[j-1]
                dp[i][j] = 1 + dp[i-1][j-1]
            else
                dp[i][j] = [dp[i-1][j], dp[i][j-1]].max
            end
        end
    end
    
    n + m - 2 * dp[n][m]
end
