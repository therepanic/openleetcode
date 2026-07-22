# @param {String} s
# @param {Integer} k
# @return {Integer}
def palindrome_partition(s, k)
    n = s.length
    c = Array.new(n) { Array.new(n, 0) }
    (2..n).each do |l|
        (0..n - l).each do |i|
            j = i + l - 1
            c[i][j] = (l > 2 ? c[i + 1][j - 1] : 0) + (s[i] != s[j] ? 1 : 0)
        end
    end
    dp = Array.new(k + 1) { Array.new(n + 1, Float::INFINITY) }
    dp[0][0] = 0
    (1..n).each do |i|
        dp[1][i] = c[0][i - 1]
    end
    (2..k).each do |p|
        (p..n).each do |i|
            mn = Float::INFINITY
            (p - 1...i).each do |t|
                mn = [mn, dp[p - 1][t] + c[t][i - 1]].min
            end
            dp[p][i] = mn
        end
    end
    dp[k][n].to_i
end
