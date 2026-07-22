# @param {Integer[]} nums
# @return {Integer}
def longest_subarray(nums)
    left = 0
    zeros = 0
    res = 0
    (0...nums.length).each do |right|
        zeros += 1 if nums[right] == 0
        while zeros > 1
            zeros -= 1 if nums[left] == 0
            left += 1
        end
        res = [res, right - left].max
    end
    res
end
