# @param {Integer[]} nums
# @return {Integer}
def array_nesting(nums)
    max_count = 0
    
    (0...nums.length).each do |i|
        next if nums[i] == -1
        
        current_count = 0
        start = i
        
        while nums[start] != -1
            next_node = nums[start]
            nums[start] = -1
            start = next_node
            current_count += 1
        end
        
        max_count = current_count if current_count > max_count
    end
    
    max_count
end
