class Solution {
    fun winnerSquareGame(n: Int): Boolean {
        val memo = Array(2) { IntArray(n + 1) { -1 } }
        fun dp(player: Int, stones: Int): Boolean {
            if (stones == 0) return false
            if (memo[player][stones] != -1) return memo[player][stones] == 1
            val sqrt = kotlin.math.sqrt(stones.toDouble()).toInt()
            for (i in sqrt downTo 1) {
                val sq = i * i
                if (sq == stones || !dp(player xor 1, stones - sq)) {
                    memo[player][stones] = 1
                    return true
                }
            }
            memo[player][stones] = 0
            return false
        }
        return dp(0, n)
    }
}
