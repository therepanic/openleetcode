class Solution {
    fun snakesAndLadders(board: Array<IntArray>): Int {
        val n = board.size
        val minRolls = IntArray(n * n + 1) { -1 }
        val q: java.util.Queue<Int> = java.util.LinkedList()
        minRolls[1] = 0
        q.offer(1)

        while (q.isNotEmpty()) {
            val x = q.poll()
            for (i in 1..6) {
                var t = x + i
                if (t > n * n) break
                val row = (t - 1) / n
                val col = (t - 1) % n
                val r = n - 1 - row
                val c = if (row % 2 == 1) n - 1 - col else col
                val v = board[r][c]
                val y = if (v > 0) v else t
                if (y == n * n) return minRolls[x] + 1
                if (minRolls[y] == -1) {
                    minRolls[y] = minRolls[x] + 1
                    q.offer(y)
                }
            }
        }
        return -1
    }
}
