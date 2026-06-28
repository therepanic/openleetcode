# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def smallest_distance_pair(nums, k)
    nums.sort!
    n = nums.length
    low = 0
    high = nums[-1] - nums[0]

    while low < high
        mid = (low + high) / 2
        count = 0
        j = 0
        (0...n).each do |i|
            while j < n && nums[j] - nums[i] <= mid
                j += 1
            end
            count += j - i - 1
        end

        if count < k
            low = mid + 1
        else
            high = mid
        end
    end

    low
end
