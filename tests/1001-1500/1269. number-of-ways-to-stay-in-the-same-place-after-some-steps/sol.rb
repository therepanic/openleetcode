# @param {Integer} steps
# @param {Integer} arr_len
# @return {Integer}
def num_ways(steps, arr_len)
    mod = 10**9 + 7
    max_pos = [steps / 2, arr_len - 1].min
    dp = [0] * (max_pos + 1)
    dp[0] = 1
    steps.times do
        new_dp = [0] * (max_pos + 1)
        (0..max_pos).each do |pos|
            next if dp[pos] == 0
            new_dp[pos] = (new_dp[pos] + dp[pos]) % mod
            new_dp[pos - 1] = (new_dp[pos - 1] + dp[pos]) % mod if pos > 0
            new_dp[pos + 1] = (new_dp[pos + 1] + dp[pos]) % mod if pos < max_pos
        end
        dp = new_dp
    end
    dp[0]
end
