class Solution {
    fun pathsWithMaxScore(board: Array<String>): IntArray {
        val MOD = 1_000_000_007
        val n = board.size

        var nextScore = IntArray(n + 1) { -1 }
        var nextWays = IntArray(n + 1) { 0 }

        for (i in n - 1 downTo 0) {
            val currScore = IntArray(n + 1) { -1 }
            val currWays = IntArray(n + 1) { 0 }

            val row = board[i]
            for (j in n - 1 downTo 0) {
                val cell = row[j]

                if (cell == 'X') {
                    continue
                }

                if (cell == 'S') {
                    currScore[j] = 0
                    currWays[j] = 1
                    continue
                }

                val best = maxOf(nextScore[j], currScore[j + 1], nextScore[j + 1])

                if (best == -1) {
                    continue
                }

                var ways = 0

                if (nextScore[j] == best) {
                    ways = (ways + nextWays[j]) % MOD
                }
                if (currScore[j + 1] == best) {
                    ways = (ways + currWays[j + 1]) % MOD
                }
                if (nextScore[j + 1] == best) {
                    ways = (ways + nextWays[j + 1]) % MOD
                }

                val value = if (cell == 'E') 0 else cell - '0'

                currScore[j] = best + value
                currWays[j] = ways
            }

            nextScore = currScore
            nextWays = currWays
        }

        if (nextScore[0] == -1) {
            return intArrayOf(0, 0)
        }

        return intArrayOf(nextScore[0], nextWays[0])
    }
}
