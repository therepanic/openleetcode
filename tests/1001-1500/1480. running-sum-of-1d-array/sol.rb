# @param {Integer[]} nums
# @return {Integer[]}
def running_sum(nums)
    (1...nums.length).each do |i|
        nums[i] += nums[i - 1]
    end
    nums
end
