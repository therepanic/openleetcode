class Solution {
    fun stoneGameIII(stoneValue: IntArray): String {
        val n = stoneValue.size
        val dp = IntArray(3)

        for (i in n - 1 downTo 0) {
            val takeOne = stoneValue[i] - dp[(i + 1) % 3]

            var takeTwo = Int.MIN_VALUE
            if (i + 1 < n) {
                takeTwo = stoneValue[i] + stoneValue[i + 1] - dp[(i + 2) % 3]
            }

            var takeThree = Int.MIN_VALUE
            if (i + 2 < n) {
                takeThree = stoneValue[i] + stoneValue[i + 1] + stoneValue[i + 2] - dp[(i + 3) % 3]
            }

            dp[i % 3] = maxOf(takeOne, takeTwo, takeThree)
        }

        val value = dp[0]
        return when {
            value > 0 -> "Alice"
            value < 0 -> "Bob"
            else -> "Tie"
        }
    }
}
