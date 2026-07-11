# @param {Integer[]} nums
# @return {Integer}
def min_increment_for_unique(nums)
    nums.sort!
    res = 0
    (1...nums.length).each do |i|
        if nums[i] <= nums[i-1]
            target = nums[i-1] + 1
            res += target - nums[i]
            nums[i] = target
        end
    end
    res
end
