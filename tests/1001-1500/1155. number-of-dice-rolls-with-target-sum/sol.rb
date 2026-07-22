# @param {Integer} n
# @param {Integer} k
# @param {Integer} target
# @return {Integer}
def num_rolls_to_target(n, k, target)
    mod = 10**9 + 7
    
    dp = Array.new(target + 1, 0)
    dp[0] = 1
    
    n.times do
        new_dp = Array.new(target + 1, 0)
        window_sum = 0
        
        (1..target).each do |s|
            window_sum = (window_sum + dp[s - 1]) % mod
            
            if s > k
                window_sum = (window_sum - dp[s - k - 1] + mod) % mod
            end
            
            new_dp[s] = window_sum
        end
        
        dp = new_dp
    end
    
    dp[target]
end
