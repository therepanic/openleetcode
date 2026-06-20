# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
    result = []
    i = 0
    
    while i < nums.length
        start = nums[i]
        j = i
        while j + 1 < nums.length && nums[j + 1] == nums[j] + 1
            j += 1
        end
        
        if nums[j] == start
            result << start.to_s
        else
            result << "#{start}->#{nums[j]}"
        end
        
        i = j + 1
    end
    
    result
end
