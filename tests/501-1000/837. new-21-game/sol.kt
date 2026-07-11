class Solution {
    fun new21Game(n: Int, k: Int, maxPts: Int): Double {
        if (k == 0 || n >= k - 1 + maxPts) {
            return 1.0
        }

        val dp = DoubleArray(maxPts)
        dp[0] = 1.0

        var windowSum = 1.0
        var result = 0.0

        for (i in 1..n) {
            val prob = windowSum / maxPts

            if (i < k) {
                windowSum += prob
            } else {
                result += prob
            }

            if (i >= maxPts) {
                windowSum -= dp[i % maxPts]
            }

            dp[i % maxPts] = prob
        }

        return result
    }
}
