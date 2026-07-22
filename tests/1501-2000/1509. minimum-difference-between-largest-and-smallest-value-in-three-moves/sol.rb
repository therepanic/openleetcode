# @param {Integer[]} nums
# @return {Integer}
def min_difference(nums)
    return 0 if nums.length <= 3
    nums.sort!
    n = nums.length
    return [
        nums[n-4] - nums[0],
        nums[n-3] - nums[1],
        nums[n-2] - nums[2],
        nums[n-1] - nums[3]
    ].min
end
