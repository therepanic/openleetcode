# @param {Integer} amount
# @param {Integer[]} coins
# @return {Integer}
def change(amount, coins)
    n = coins.length
    dp = Array.new(n + 1) { Array.new(amount + 1, 0) }
    
    (0..n).each do |i|
        dp[i][0] = 1
    end
    
    (1..n).each do |i|
        (1..amount).each do |j|
            if coins[i-1] <= j
                dp[i][j] = dp[i][j - coins[i-1]] + dp[i-1][j]
            else
                dp[i][j] = dp[i-1][j]
            end
        end
    end
    
    dp[n][amount]
end
