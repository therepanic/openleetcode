# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}
def find_max_average(nums, k)
    window_sum = nums[0...k].sum
    max_sum = window_sum
    
    (k...nums.length).each do |i|
        window_sum = window_sum - nums[i - k] + nums[i]
        max_sum = [max_sum, window_sum].max
    end
    
    max_sum.to_f / k
end
