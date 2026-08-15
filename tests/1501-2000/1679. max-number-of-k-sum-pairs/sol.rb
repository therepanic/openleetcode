# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_operations(nums, k)
    nums.sort!
    i, j = 0, nums.length - 1
    count = 0

    while i < j
        total = nums[i] + nums[j]
        if total == k
            count += 1
            i += 1
            j -= 1
        elsif total > k
            j -= 1
        else
            i += 1
        end
    end

    count
end
