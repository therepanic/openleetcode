# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def min_k_bit_flips(nums, k)
    n = nums.length
    ans = 0
    flips = 0
    flipped = Array.new(n + 1, 0)

    (0...n - k + 1).each do |i|
        flips += flipped[i]
        if (nums[i] == 0 && flips % 2 == 0) || (nums[i] == 1 && flips % 2 != 0)
            flips += 1
            ans += 1
            flipped[i + k] -= 1
        end
    end

    (n - k + 1...n).each do |i|
        flips += flipped[i]
        if (nums[i] == 0 && flips % 2 == 0) || (nums[i] == 1 && flips % 2 != 0)
            return -1
        end
    end

    ans
end
