# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def split_array(nums, k)
    helper = ->(per_k) {
        count = 1
        curr_sum = 0
        nums.each do |num|
            if curr_sum + num > per_k
                count += 1
                curr_sum = num
            else
                curr_sum += num
            end
        end
        count <= k
    }

    high = nums.sum
    low = nums.max
    soln = 0
    while low <= high
        mid = low + (high - low) / 2
        if helper.call(mid)
            soln = mid
            high = mid - 1
        else
            low = mid + 1
        end
    end
    soln
end
