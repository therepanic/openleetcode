class Solution {
    fun maxJumps(arr: IntArray, d: Int): Int {
        val n = arr.size
        val dp = IntArray(n) { -1 }

        fun dfs(i: Int): Int {
            if (dp[i] != -1) return dp[i]

            var best = 1

            // Right scan
            for (nxt in i + 1..minOf(n - 1, i + d)) {
                if (arr[nxt] >= arr[i]) break
                best = maxOf(best, 1 + dfs(nxt))
            }

            // Left scan
            for (nxt in i - 1 downTo maxOf(0, i - d)) {
                if (arr[nxt] >= arr[i]) break
                best = maxOf(best, 1 + dfs(nxt))
            }

            dp[i] = best
            return dp[i]
        }

        return (0 until n).maxOf { dfs(it) }
    }
}
