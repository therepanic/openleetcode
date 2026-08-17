# @param {Integer[]} nums
# @return {Boolean}
def can_be_increasing(nums)
    n = nums.length
    idx = -1
    
    # Find first distortion
    (0...n-1).each do |i|
        if nums[i] >= nums[i + 1]
            idx = i
            break
        end
    end
    
    flag = true
    ((idx + 1)...(n - 1)).each do |i|
        if nums[i] >= nums[i + 1]
            flag = false
            break
        end
    end
    
    return true if (idx == 0 || idx == n - 1) && flag
    return true if idx - 1 >= 0 && idx + 1 < n && nums[idx - 1] < nums[idx + 1] && flag
    
    # Check from the end
    (n - 1).downto(1) do |i|
        if nums[i] <= nums[i - 1]
            idx = i
            break
        end
    end
    
    flag = true
    (idx - 1).downto(1) do |i|
        if nums[i] <= nums[i - 1]
            flag = false
            break
        end
    end
    
    return true if (idx == 0 || idx == n - 1) && flag
    return false if idx - 1 >= 0 && idx + 1 < n && nums[idx - 1] >= nums[idx + 1]
    flag
end
