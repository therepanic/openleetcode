# @param {Integer[]} nums
# @return {Integer}
def max_width_ramp(nums)
    n = nums.length
    right_max = Array.new(n, 0)
    right_max[-1] = nums[-1]
    
    (n - 2).downto(0) do |i|
        right_max[i] = [nums[i], right_max[i + 1]].max
    end
    
    i = 0
    j = 0
    result = 0
    while j < n
        if nums[i] <= right_max[j]
            result = [result, j - i].max
            j += 1
        else
            i += 1
        end
    end
    
    result
end
