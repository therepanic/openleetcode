class Solution {
    fun rotatedDigits(n: Int): Int {
        val dp = IntArray(n + 1)
        var count = 0

        for (i in 0..n) {
            if (i < 10) {
                when (i) {
                    0, 1, 8 -> dp[i] = 1
                    2, 5, 6, 9 -> {
                        dp[i] = 2
                        count++
                    }
                    else -> dp[i] = 0
                }
            } else {
                val a = dp[i / 10]
                val b = dp[i % 10]

                if (a == 1 && b == 1) {
                    dp[i] = 1
                } else if (a >= 1 && b >= 1) {
                    dp[i] = 2
                    count++
                } else {
                    dp[i] = 0
                }
            }
        }

        return count
    }
}
