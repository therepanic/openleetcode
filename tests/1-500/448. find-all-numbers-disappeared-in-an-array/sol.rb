# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
    nums.each do |num|
        idx = num.abs - 1
        if nums[idx] > 0
            nums[idx] *= -1
        end
    end
    res = []
    nums.each_with_index do |num, i|
        if num > 0
            res << i + 1
        end
    end
    res
end
