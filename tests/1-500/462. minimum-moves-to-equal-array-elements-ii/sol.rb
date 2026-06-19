# @param {Integer[]} nums
# @return {Integer}
def min_moves2(nums)
    nums.sort!
    median = nums[nums.length / 2]
    nums.sum { |num| (num - median).abs }
end
