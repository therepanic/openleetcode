# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_frequency(nums, k)
    nums.sort!
    left = 0
    right = 0
    res = 0
    total = 0

    while right < nums.length
        total += nums[right]

        while nums[right] * (right - left + 1) > total + k
            total -= nums[left]
            left += 1
        end
        
        res = [res, right - left + 1].max
        right += 1
    end
    
    res
end
