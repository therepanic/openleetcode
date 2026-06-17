# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer}
def min_patches(nums, n)
    current_sum = 1
    patches = 0
    index = 0
    
    while current_sum <= n
        if index < nums.length && nums[index] <= current_sum
            current_sum += nums[index]
            index += 1
        else
            current_sum += current_sum
            patches += 1
        end
    end
    
    patches
end
