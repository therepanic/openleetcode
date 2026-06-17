# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
    dp = Array.new(amount + 1, amount + 1)
    dp[0] = 0
    
    (1..amount).each do |i|
        coins.each do |coin|
            if i - coin >= 0
                dp[i] = [dp[i], 1 + dp[i - coin]].min
            end
        end
    end
    
    dp[amount] != amount + 1 ? dp[amount] : -1
end
