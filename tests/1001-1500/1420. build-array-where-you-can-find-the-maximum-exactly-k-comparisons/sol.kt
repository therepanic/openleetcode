class Solution {
    private val MOD = 1_000_000_007
    private lateinit var dp: Array<Array<IntArray>>
    private var n = 0
    private var m = 0
    private var k = 0

    fun numOfArrays(n: Int, m: Int, k: Int): Int {
        this.n = n
        this.m = m
        this.k = k
        dp = Array(n + 1) { Array(k + 1) { IntArray(m + 1) { -1 } } }
        return solve(0, 0, 0)
    }

    private fun solve(idx: Int, searchCost: Int, maxValue: Int): Int {
        if (idx == n) return if (searchCost == k) 1 else 0
        if (searchCost > k) return 0
        if (dp[idx][searchCost][maxValue] != -1) return dp[idx][searchCost][maxValue]

        var result = 0
        for (i in 1..m) {
            if (i > maxValue) {
                result = (result + solve(idx + 1, searchCost + 1, i)) % MOD
            } else {
                result = (result + solve(idx + 1, searchCost, maxValue)) % MOD
            }
        }

        dp[idx][searchCost][maxValue] = result
        return result
    }
}
