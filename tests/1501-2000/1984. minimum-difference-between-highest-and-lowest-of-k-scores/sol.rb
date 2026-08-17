# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def minimum_difference(nums, k)
    nums.sort!
    ans = nums[k - 1] - nums[0]
    (0..(nums.length - k)).each do |i|
        ans = [ans, nums[i + k - 1] - nums[i]].min
    end
    ans
end
