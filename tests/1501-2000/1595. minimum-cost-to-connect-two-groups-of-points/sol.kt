class Solution {
    fun connectTwoGroups(cost: Array<IntArray>): Int {
        return connectTwoGroups(cost.map { it.toList() })
    }

    fun connectTwoGroups(cost: List<List<Int>>): Int {
        val m = cost.size
        val n = cost[0].size
        val mn = IntArray(n) { j -> (0 until m).map { cost[it][j] }.min()!! }
        val memo = Array(m+1) { IntArray(1 shl n) { -1 } }
        fun fn(i: Int, mask: Int): Int {
            if (memo[i][mask] != -1) return memo[i][mask]
            if (i == m) {
                var sum = 0
                for (j in 0 until n) {
                    if ((mask and (1 shl j)) == 0) sum += mn[j]
                }
                memo[i][mask] = sum
            } else {
                var best = Int.MAX_VALUE
                for (j in 0 until n) {
                    best = minOf(best, cost[i][j] + fn(i+1, mask or (1 shl j)))
                }
                memo[i][mask] = best
            }
            return memo[i][mask]
        }
        return fn(0, 0)
    }
}
