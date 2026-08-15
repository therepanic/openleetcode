# @param {Integer[]} nums
# @param {Integer} max_operations
# @return {Integer}
def minimum_size(nums, max_operations)
    lo, hi = 1, nums.max
    while lo < hi
        mid = (lo + hi) / 2
        needed = nums.sum { |x| (x - 1) / mid }
        if needed <= max_operations
            hi = mid
        else
            lo = mid + 1
        end
    end
    lo
end
