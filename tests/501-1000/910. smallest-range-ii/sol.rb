# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def smallest_range_ii(nums, k)
    nums.sort!
    n = nums.length
    ans = nums[-1] - nums[0]
    (0...n-1).each do |i|
        high = [nums[-1] - k, nums[i] + k].max
        low = [nums[0] + k, nums[i+1] - k].min
        ans = [ans, high - low].min
    end
    ans
end
