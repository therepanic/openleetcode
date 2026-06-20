# @param {Integer[]} nums
# @param {Integer} index_diff
# @param {Integer} value_diff
# @return {Boolean}
def contains_nearby_almost_duplicate(nums, index_diff, value_diff)
    if index_diff <= 0 || value_diff < 0
        return false
    end

    width = value_diff + 1
    buckets = {}

    nums.each_with_index do |x, i|
        bid = x / width

        if buckets.key?(bid)
            return true
        end

        if buckets.key?(bid - 1) && (x - buckets[bid - 1]).abs <= value_diff
            return true
        end
        if buckets.key?(bid + 1) && (x - buckets[bid + 1]).abs <= value_diff
            return true
        end

        buckets[bid] = x

        if i >= index_diff
            old = nums[i - index_diff]
            buckets.delete(old / width)
        end
    end

    false
end
