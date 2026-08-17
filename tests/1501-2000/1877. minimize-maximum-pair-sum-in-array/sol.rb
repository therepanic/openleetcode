# @param {Integer[]} nums
# @return {Integer}
def min_pair_sum(nums)
    nums.sort!
    max_sum = 0
    l = 0
    r = nums.length - 1
    while l < r
        max_sum = [max_sum, nums[l] + nums[r]].max
        l += 1
        r -= 1
    end
    max_sum
end
