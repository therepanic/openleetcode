class Solution {
    fun minCost(n: Int, cuts: IntArray): Int {
        val c = (cuts + intArrayOf(0, n)).sortedArray()
        val m = c.size
        val memo = Array(m) { IntArray(m) { -1 } }
        return optimize(0, m-1, c, memo)
    }
    
    private fun optimize(i: Int, j: Int, c: IntArray, memo: Array<IntArray>): Int {
        if (j - i <= 1) return 0
        if (memo[i][j] != -1) return memo[i][j]
        var res = Int.MAX_VALUE
        for (k in i+1 until j) {
            val val1 = optimize(i, k, c, memo)
            val val2 = optimize(k, j, c, memo)
            res = minOf(res, val1 + val2)
        }
        memo[i][j] = res + (c[j] - c[i])
        return memo[i][j]
    }
}
