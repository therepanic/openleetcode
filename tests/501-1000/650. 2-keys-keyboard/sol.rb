# @param {Integer} n
# @return {Integer}
def min_steps(n)
    return 0 if n == 1
    dp = [0] * (n + 1)
    (2..n).each do |i|
        dp[i] = i
        (i - 1).downto(1) do |j|
            if i % j == 0
                dp[i] = dp[j] + (i / j)
                break
            end
        end
    end
    dp[n]
end
