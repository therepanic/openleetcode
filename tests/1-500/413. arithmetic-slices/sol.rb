# @param {Integer[]} nums
# @return {Integer}
def number_of_arithmetic_slices(nums)
    c = 0
    t = 2
    (1...nums.length-1).each do |i|
        if nums[i-1] - nums[i] == nums[i] - nums[i+1]
            t += 1
        else
            t = 2
        end
        c += t - 2
    end
    c
end
