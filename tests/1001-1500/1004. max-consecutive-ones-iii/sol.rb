# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def longest_ones(nums, k)
    left, max_length, zero_count = 0, 0, 0
    nums.each_with_index do |num, right|
        zero_count += 1 if num == 0
        while zero_count > k
            zero_count -= 1 if nums[left] == 0
            left += 1
        end
        max_length = [max_length, right - left + 1].max
    end
    max_length
end
