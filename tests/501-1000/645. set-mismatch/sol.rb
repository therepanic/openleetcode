# @param {Integer[]} nums
# @return {Integer[]}
def find_error_nums(nums)
    i = 0
    while i < nums.length
        correct = nums[i] - 1
        if nums[i] != nums[correct]
            nums[i], nums[correct] = nums[correct], nums[i]
        else
            i += 1
        end
    end
    
    (0...nums.length).each do |i|
        if nums[i] != i + 1
            return [nums[i], i + 1]
        end
    end
    []
end
