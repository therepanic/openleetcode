# @param {String} num
# @return {Integer}
def number_of_combinations(num)
    n = num.length
    mod = 10**9 + 7
    dp = Array.new(n) { Array.new(n + 1, 0) }
    (0...n).each do |i|
        if num[i] != '0'
            (i + 1..n).each do |j|
                if i == 0
                    dp[i][j] = 1
                else
                    length = j - i
                    dp[i][j] = dp[i][j - 1]
                    if i - length >= 0 && num[i - length, length] <= num[i, length]
                        dp[i][j] += dp[i - length][i]
                    end
                    if i - length + 1 >= 0 && num[i - length + 1, length - 1] > num[i, length - 1]
                        dp[i][j] += dp[i - length + 1][i]
                    end
                    dp[i][j] %= mod
                end
            end
        end
    end
    ans = 0
    (0...n).each { |i| ans = (ans + dp[i][n]) % mod }
    ans
end
