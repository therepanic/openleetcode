# @param {Integer[]} nums
# @param {Integer} left
# @param {Integer} right
# @return {Integer}
def num_subarray_bounded_max(nums, left, right)
    res = 0
    dp = 0
    prev = -1
    nums.each_with_index do |num, i|
        if num < left && i > 0
            res += dp
        end
        if num > right
            dp = 0
            prev = i
        end
        if left <= num && num <= right
            dp = i - prev
            res += dp
        end
    end
    res
end
