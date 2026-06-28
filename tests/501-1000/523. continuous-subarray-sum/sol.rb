# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def check_subarray_sum(nums, k)
    return false if nums.empty?

    prefix_sum = 0
    remainder_map = {0 => -1}

    nums.each_with_index do |num, i|
        prefix_sum += num
        remainder = prefix_sum % k

        if remainder_map.key?(remainder)
            return true if i - remainder_map[remainder] > 1
        else
            remainder_map[remainder] = i
        end
    end

    false
end
