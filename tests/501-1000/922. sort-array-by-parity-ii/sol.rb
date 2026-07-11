# @param {Integer[]} nums
# @return {Integer[]}
def sort_array_by_parity_ii(nums)
    i, j = 0, 1
    n = nums.length
    
    while i < n && j < n
        if nums[i] % 2 == 0
            i += 2
        elsif nums[j] % 2 == 1
            j += 2
        else
            nums[i], nums[j] = nums[j], nums[i]
            i += 2
            j += 2
        end
    end
    nums
end
