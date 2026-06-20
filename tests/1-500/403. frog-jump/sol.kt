class Solution {
    fun canCross(stones: IntArray): Boolean {
        val dp = mutableMapOf<Int, MutableSet<Int>>()
        for (stone in stones) {
            dp[stone] = mutableSetOf()
        }
        dp[0] = mutableSetOf(0)

        for (stone in stones) {
            for (jump in dp[stone]!!) {
                for (jumpDistance in listOf(jump - 1, jump, jump + 1)) {
                    if (jumpDistance > 0 && dp.containsKey(stone + jumpDistance)) {
                        dp[stone + jumpDistance]!!.add(jumpDistance)
                    }
                }
            }
        }

        return dp[stones.last()]!!.isNotEmpty()
    }
}
