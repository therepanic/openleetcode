class Solution {
    fun lastStoneWeightII(stones: IntArray): Int {
        val n = stones.size
        val total = stones.sum()
        val target = total / 2
        var dp_prev = IntArray(target + 1)
        for (i in n - 1 downTo 0) {
            val dp_curr = IntArray(target + 1)
            for (size in 0..target) {
                val skip = dp_prev[size]
                val take = if (size >= stones[i]) dp_prev[size - stones[i]] + stones[i] else Int.MIN_VALUE
                dp_curr[size] = maxOf(skip, take)
            }
            dp_prev = dp_curr
        }
        return total - 2 * dp_prev[target]
    }
}
