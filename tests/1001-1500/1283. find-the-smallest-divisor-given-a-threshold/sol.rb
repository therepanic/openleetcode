# @param {Integer[]} nums
# @param {Integer} threshold
# @return {Integer}
def smallest_divisor(nums, threshold)
    low = 1
    high = nums.max
    ans = high

    while low <= high
        mid = low + (high - low) / 2

        total = 0
        nums.each do |num|
            total += (num + mid - 1) / mid
        end

        if total <= threshold
            ans = mid
            high = mid - 1
        else
            low = mid + 1
        end
    end

    ans
end
