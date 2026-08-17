# @param {Integer[]} nums
# @return {Integer}
def max_absolute_sum(nums)
    prefix_sum = 0
    min_prefix_sum = 0
    max_prefix_sum = 0
    max_absolute_sum = 0

    nums.each do |num|
        prefix_sum += num
        
        max_absolute_sum = [max_absolute_sum, (prefix_sum - min_prefix_sum).abs].max
        max_absolute_sum = [max_absolute_sum, (prefix_sum - max_prefix_sum).abs].max
        
        min_prefix_sum = [min_prefix_sum, prefix_sum].min
        max_prefix_sum = [max_prefix_sum, prefix_sum].max
    end

    max_absolute_sum
end
