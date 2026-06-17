# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
    window_set = Set.new
    
    nums.each_with_index do |num, i|
        if i > k
            window_set.delete(nums[i - k - 1])
        end
        
        if window_set.include?(num)
            return true
        end
        
        window_set.add(num)
    end
    
    return false
end
