class Solution {
    fun countBits(n: Int): IntArray {
        val dp = IntArray(n + 1)
        var sub = 1
        for (i in 1..n) {
            if (sub * 2 == i) {
                sub = i
            }
            dp[i] = dp[i - sub] + 1
        }
        return dp
    }
}
