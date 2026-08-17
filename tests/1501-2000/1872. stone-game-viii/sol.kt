class Solution {
    fun stoneGameVIII(stones: IntArray): Int {
        val n = stones.size
        val prefix = stones.clone()
        for (i in 1 until n) {
            prefix[i] += prefix[i-1]
        }
        var best = prefix[n - 1]
        for (i in n - 2 downTo 1) {
            best = maxOf(best, prefix[i] - best)
        }
        return best
    }
}
