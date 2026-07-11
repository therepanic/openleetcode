# @param {Integer[]} nums
# @return {Integer}
def repeated_n_times(nums)
    n = nums.length - 2
    (0...n).each do |i|
        return nums[i] if nums[i] == nums[i + 1] || nums[i] == nums[i + 2]
    end
    nums[n + 1]
end
