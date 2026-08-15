# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_result(nums, k)
    n = nums.length
    dp = Array.new(n, 0)
    dp[0] = nums[0]
    dq = [0]
    head = 0
    (1...n).each do |i|
        head += 1 if dq[head] < i - k
        dp[i] = nums[i] + dp[dq[head]]
        while dq.length > head && dp[dq[-1]] <= dp[i]
            dq.pop
        end
        dq << i
    end
    dp[-1]
end
