# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def num_subseq(nums, target)
    mod = 10**9 + 7
    values = nums.sort
    n = values.length

    power = [1] * n
    (1...n).each { |i| power[i] = (power[i - 1] * 2) % mod }

    left, right = 0, n - 1
    result = 0

    while left <= right
        if values[left] + values[right] <= target
            result = (result + power[right - left]) % mod
            left += 1
        else
            right -= 1
        end
    end

    result
end
