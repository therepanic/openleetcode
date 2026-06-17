# @param {Integer[]} nums
# @return {Integer[]}
def largest_divisible_subset(nums)
    nums.sort!
    dp = Array.new(nums.length, 1)
    prev = Array.new(nums.length, -1)
    maxi = 0
    (1...nums.length).each do |i|
        (0...i).each do |j|
            if nums[i] % nums[j] == 0 && dp[i] < dp[j] + 1
                dp[i] = dp[j] + 1
                prev[i] = j
            end
        end
        if dp[i] > dp[maxi]
            maxi = i
        end
    end
    res = []
    i = maxi
    while i >= 0
        res << nums[i]
        i = prev[i]
    end
    res
end
