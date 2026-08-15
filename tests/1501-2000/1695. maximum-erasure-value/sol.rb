# @param {Integer[]} nums
# @return {Integer}
def maximum_unique_subarray(nums)
    res = 0
    cur_sum = 0
    start = 0
    k = 10001
    is_present = Array.new(k, false)

    nums.each_with_index do |num, end_idx|
        while is_present[num]
            is_present[nums[start]] = false
            cur_sum -= nums[start]
            start += 1
        end

        is_present[num] = true
        cur_sum += num

        res = [res, cur_sum].max
    end

    res
end
