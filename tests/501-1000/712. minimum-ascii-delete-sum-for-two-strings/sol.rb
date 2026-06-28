# @param {String} s1
# @param {String} s2
# @return {Integer}
def minimum_delete_sum(s1, s2)
    n, m = s1.length, s2.length
    dp = Array.new(n + 1) { Array.new(m + 1, 0) }
    (0...n).each do |i|
        (0...m).each do |j|
            if s1[i] == s2[j]
                dp[i + 1][j + 1] = dp[i][j] + s1[i].ord
            else
                dp[i + 1][j + 1] = [dp[i][j + 1], dp[i + 1][j]].max
            end
        end
    end
    total_ascii = s1.each_char.sum(&:ord) + s2.each_char.sum(&:ord)
    total_ascii - 2 * dp[n][m]
end
