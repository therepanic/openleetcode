# @param {Integer[]} nums
# @return {Boolean}
def is_monotonic(nums)
    n = nums.length
    if nums[0] < nums[-1]
        (1...n).each do |i|
            return false if nums[i] < nums[i - 1]
        end
    else
        (1...n).each do |i|
            return false if nums[i] > nums[i - 1]
        end
    end
    true
end
