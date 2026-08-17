func minimumXORSum(nums1 []int, nums2 []int) int {
    n := len(nums1)
    fullMask := 1 << n
    dp := make([]int, fullMask)
    for i := range dp {
        dp[i] = 2147483647
    }
    dp[0] = 0
    for mask := 0; mask < fullMask; mask++ {
        idx := bits.OnesCount(uint(mask))
        if idx >= n {
            continue
        }
        for j := 0; j < n; j++ {
            if (mask & (1 << j)) == 0 {
                nextMask := mask | (1 << j)
                cost := dp[mask] + (nums1[idx] ^ nums2[j])
                if cost < dp[nextMask] {
                    dp[nextMask] = cost
                }
            }
        }
    }
    return dp[fullMask-1]
}
