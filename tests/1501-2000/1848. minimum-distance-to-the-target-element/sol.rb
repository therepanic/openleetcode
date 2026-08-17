# @param {Integer[]} nums
# @param {Integer} target
# @param {Integer} start
# @return {Integer}
def get_min_distance(nums, target, start)
    return 0 if nums[start] == target
    
    n = nums.length
    d = 1
    
    loop do
        return d if start - d >= 0 && nums[start - d] == target
        return d if start + d < n && nums[start + d] == target
        d += 1
    end
end
