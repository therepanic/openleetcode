# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def maximum_score(nums, k)
    n = nums.length
    i = j = k
    cur_min = nums[k]
    res = cur_min

    while i > 0 || j < n - 1
        if i == 0
            j += 1
        elsif j == n - 1
            i -= 1
        elsif nums[i - 1] >= nums[j + 1]
            i -= 1
        else
            j += 1
        end
        cur_min = [cur_min, nums[i], nums[j]].min
        res = [res, cur_min * (j - i + 1)].max
    end

    res
end
