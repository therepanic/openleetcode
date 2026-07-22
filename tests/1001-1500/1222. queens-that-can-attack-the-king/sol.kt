class Solution {
    fun queensAttacktheKing(queens: Array<IntArray>, king: IntArray): List<List<Int>> {
        val board = Array(8) { BooleanArray(8) }
        for (q in queens) {
            board[q[0]][q[1]] = true
        }

        val directions = listOf(
            -1 to 0, 1 to 0, 0 to 1, 0 to -1,
            -1 to -1, -1 to 1, 1 to -1, 1 to 1
        )

        val ans = mutableListOf<List<Int>>()
        for ((dr, dc) in directions) {
            var r = king[0]
            var c = king[1]
            while (r in 0..7 && c in 0..7) {
                r += dr
                c += dc
                if (r !in 0..7 || c !in 0..7) break
                if (board[r][c]) {
                    ans.add(listOf(r, c))
                    break
                }
            }
        }
        return ans
    }
}
