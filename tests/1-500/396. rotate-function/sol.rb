# @param {Integer[]} nums
# @return {Integer}
def max_rotate_function(nums)
    n = nums.length
    total_sum = 0
    f = 0
    nums.each_with_index do |num, i|
        total_sum += num
        f += i * num
    end
    result = f
    (1...n).each do |k|
        f = f + total_sum - n * nums[n - k]
        result = [result, f].max
    end
    result
end
