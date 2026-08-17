# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def min_space_wasted_k_resizing(nums, k)
    n = nums.length
    p = [0] * (n + 1)
    (0...n).each do |i|
        p[i+1] = p[i] + nums[i]
    end
    dp = Array.new(n + 1, Float::INFINITY)
    max_v = 0
    (1..n).each do |i|
        max_v = [max_v, nums[i-1]].max
        dp[i] = max_v * i - p[i]
    end
    k.times do
        new_dp = Array.new(n + 1, Float::INFINITY)
        new_dp[0] = 0
        (1..n).each do |i|
            cur_max = 0
            (i-1).downto(0) do |j|
                cur_max = [cur_max, nums[j]].max
                waste = cur_max * (i - j) - (p[i] - p[j])
                new_dp[i] = [new_dp[i], dp[j] + waste].min
            end
        end
        dp = new_dp
    end
    dp[n]
end
