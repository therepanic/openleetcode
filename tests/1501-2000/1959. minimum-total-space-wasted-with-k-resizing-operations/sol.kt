class Solution {
    fun minSpaceWastedKResizing(nums: IntArray, k: Int): Int {
        val n = nums.size
        val P = IntArray(n + 1)
        for (i in 0 until n) {
            P[i+1] = P[i] + nums[i]
        }
        val inf = 1_000_000_000
        var dp = IntArray(n + 1) { inf }
        var max_v = 0
        for (i in 1..n) {
            max_v = maxOf(max_v, nums[i-1])
            dp[i] = max_v * i - P[i]
        }
        repeat(k) {
            val new_dp = IntArray(n + 1) { inf }
            new_dp[0] = 0
            for (i in 1..n) {
                var cur_max = 0
                for (j in i-1 downTo 0) {
                    cur_max = maxOf(cur_max, nums[j])
                    val waste = cur_max * (i - j) - (P[i] - P[j])
                    if (dp[j] != inf) new_dp[i] = minOf(new_dp[i], dp[j] + waste)
                }
            }
            dp = new_dp
        }
        return dp[n]
    }
}
