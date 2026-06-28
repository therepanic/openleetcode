# @param {Integer[]} nums
# @return {Integer}
def single_non_duplicate(nums)
    left = 0
    right = nums.length - 1
    
    while left < right
        mid = left + (right - left) / 2
        
        if mid % 2 == 1
            mid -= 1
        end
        
        if nums[mid] == nums[mid + 1]
            left = mid + 2
        else
            right = mid
        end
    end
    
    nums[left]
end
