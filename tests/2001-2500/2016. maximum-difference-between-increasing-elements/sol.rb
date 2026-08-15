# @param {Integer[]} nums
# @return {Integer}
def maximum_difference(nums)
    min_val = nums[0]
    max_diff = -1
    (1...nums.length).each do |i|
        if nums[i] > min_val
            max_diff = [max_diff, nums[i] - min_val].max
        else
            min_val = nums[i]
        end
    end
    max_diff
end
