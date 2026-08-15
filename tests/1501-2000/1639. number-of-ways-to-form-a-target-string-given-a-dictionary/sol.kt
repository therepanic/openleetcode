class Solution {
    fun numWays(words: Array<String>, target: String): Int {
        val MOD = 1_000_000_007L
        val m = words[0].length
        val A = Array(m) { IntArray(26) }
        for (word in words) {
            for (j in 0 until m) {
                A[j][word[j] - 'a']++
            }
        }
        val dp = Array(m) { IntArray(target.length) { -1 } }

        fun F(i: Int, j: Int): Long {
            if (j == target.length) return 1
            if (i == m) return 0
            if (dp[i][j] != -1) return dp[i][j].toLong()
            var count = F(i+1, j) % MOD
            count = (count + (A[i][target[j] - 'a'].toLong() * F(i+1, j+1)) % MOD) % MOD
            dp[i][j] = count.toInt()
            return count
        }
        return F(0, 0).toInt()
    }
}
