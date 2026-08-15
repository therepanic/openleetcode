# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def minimum_xor_sum(nums1, nums2)
    n = nums1.length
    full_mask = 1 << n
    dp = Array.new(full_mask, 2147483647)
    dp[0] = 0
    (0...full_mask).each do |mask|
        idx = mask.to_s(2).count('1')
        next if idx >= n
        (0...n).each do |j|
            if (mask & (1 << j)) == 0
                next_mask = mask | (1 << j)
                cost = dp[mask] + (nums1[idx] ^ nums2[j])
                dp[next_mask] = cost if cost < dp[next_mask]
            end
        end
    end
    dp[full_mask - 1]
end
