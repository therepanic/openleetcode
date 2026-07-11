# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def largest_sum_after_k_negations(nums, k)
    nums.sort!
    nums.each_with_index do |num, i|
        if num < 0 && k > 0
            nums[i] = -num
            k -= 1
        end
    end
    nums.sort!
    if k > 0 && k % 2 != 0
        nums[0] = -nums[0]
    end
    nums.sum
end
