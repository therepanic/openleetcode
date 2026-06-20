# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
    l = nums.length
    total = l
    summ = 0
    (0...l).each do |i|
        total += i
        summ += nums[i]
    end
    total - summ
end
