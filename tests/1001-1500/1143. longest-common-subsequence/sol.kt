class Solution {
    fun longestCommonSubsequence(text1: String, text2: String): Int {
        val m = text1.length
        val n = text2.length
        val memo = Array(m) { IntArray(n) { -1 } }

        fun solve(i: Int, j: Int): Int {
            if (i >= m || j >= n) return 0
            if (memo[i][j] != -1) return memo[i][j]

            memo[i][j] = if (text1[i] == text2[j]) {
                1 + solve(i + 1, j + 1)
            } else {
                maxOf(solve(i + 1, j), solve(i, j + 1))
            }
            return memo[i][j]
        }

        return solve(0, 0)
    }
}
