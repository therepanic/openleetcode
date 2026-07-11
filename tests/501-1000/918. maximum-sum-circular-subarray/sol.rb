# @param {Integer[]} nums
# @return {Integer}
def max_subarray_sum_circular(nums)
    max_sum = nums[0]
    min_sum = nums[0]
    curr_max_sum = nums[0]
    curr_min_sum = nums[0]
    total_sum = nums[0]
    
    (1...nums.length).each do |i|
        curr_max_sum = [curr_max_sum + nums[i], nums[i]].max
        max_sum = [max_sum, curr_max_sum].max
        
        curr_min_sum = [curr_min_sum + nums[i], nums[i]].min
        min_sum = [min_sum, curr_min_sum].min
        
        total_sum += nums[i]
    end
    
    circular_sum = total_sum - min_sum
    
    if circular_sum == 0
        return max_sum
    end
    
    [max_sum, circular_sum].max
end
