class Solution {
    fun minimumXORSum(nums1: IntArray, nums2: IntArray): Int {
        val n = nums1.size
        val fullMask = 1 shl n
        val dp = IntArray(fullMask) { Int.MAX_VALUE }
        dp[0] = 0
        for (mask in 0 until fullMask) {
            val idx = Integer.bitCount(mask)
            if (idx >= n) continue
            for (j in 0 until n) {
                if ((mask and (1 shl j)) == 0) {
                    val nextMask = mask or (1 shl j)
                    val cost = dp[mask] + (nums1[idx] xor nums2[j])
                    if (cost < dp[nextMask]) {
                        dp[nextMask] = cost
                    }
                }
            }
        }
        return dp[fullMask - 1]
    }
}
