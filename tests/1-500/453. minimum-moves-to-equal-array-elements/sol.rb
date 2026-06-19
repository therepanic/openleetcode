# @param {Integer[]} nums
# @return {Integer}
def min_moves(nums)
    nums.sum - nums.length * nums.min
end
