class Solution {
    fun stoneGameII(piles: IntArray): Int {
        val n = piles.size
        val suffix = IntArray(n + 1)
        for (i in n - 1 downTo 0) {
            suffix[i] = suffix[i + 1] + piles[i]
        }
        val memo = Array(n) { IntArray(n + 1) { -1 } }
        
        fun best(i: Int, m: Int): Int {
            if (i >= n) return 0
            if (memo[i][m] != -1) return memo[i][m]
            var answer = 0
            for (x in 1..minOf(2 * m, n - i)) {
                answer = maxOf(answer, suffix[i] - best(i + x, maxOf(m, x)))
            }
            memo[i][m] = answer
            return answer
        }
        
        return best(0, 1)
    }
}
