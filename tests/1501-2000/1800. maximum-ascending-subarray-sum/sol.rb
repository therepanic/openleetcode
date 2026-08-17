# @param {Integer[]} nums
# @return {Integer}
def max_ascending_sum(nums)
    curr = ans = nums[0]
    (1...nums.length).each do |i|
        curr = nums[i] > nums[i-1] ? curr + nums[i] : nums[i]
        ans = [ans, curr].max
    end
    ans
end
