# @param {Integer[]} nums
# @param {Integer} x
# @return {Integer}
def min_operations(nums, x)
    sub_sum = nums.sum - x
    n = nums.length
    opes = n
    return n if sub_sum == 0
    l, r, sld_sum = 0, 0, 0
    
    while r < n
        opes = [opes, n - (r - l)].min if sld_sum == sub_sum
        sld_sum += nums[r]
        while l < r && sld_sum > sub_sum
            sld_sum -= nums[l]
            l += 1
        end
        r += 1
    end

    opes = [opes, n - (r - l)].min if sld_sum == sub_sum

    opes == n ? -1 : opes
end
