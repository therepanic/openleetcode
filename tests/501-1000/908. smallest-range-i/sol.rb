# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def smallest_range_i(nums, k)
    min_val = nums[0]
    max_val = nums[0]
    
    nums.each do |val|
        if val < min_val
            min_val = val
        elsif val > max_val
            max_val = val
        end
    end
    
    [0, max_val - min_val - k * 2].max
end
