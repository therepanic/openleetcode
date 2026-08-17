# @param {Integer[]} nums
# @return {Integer}
def min_operations(nums)
    length = nums.length
    min_ops = length
    unique_nums = nums.uniq.sort
    right = 0
    
    (0...unique_nums.length).each do |left|
        while right < unique_nums.length && unique_nums[right] < unique_nums[left] + length
            right += 1
        end
        
        min_ops = [min_ops, length - (right - left)].min
    end
    
    min_ops
end
