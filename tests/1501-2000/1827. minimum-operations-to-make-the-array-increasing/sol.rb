# @param {Integer[]} nums
# @return {Integer}
def min_operations(nums)
    c = nums[0]
    s = 0
    (1...nums.length).each do |i|
        if nums[i] > c
            c = nums[i]
        else
            c += 1
            s += (c - nums[i]).abs
        end
    end
    s
end
