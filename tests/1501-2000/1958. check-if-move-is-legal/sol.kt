class Solution {
    fun checkMove(board: Array<CharArray>, rMove: Int, cMove: Int, color: Char): Boolean {
        val opposite = if (color == 'B') 'W' else 'B'
        val dirs = arrayOf(
            intArrayOf(-1,-1), intArrayOf(-1,0), intArrayOf(-1,1),
            intArrayOf(0,-1), intArrayOf(0,1),
            intArrayOf(1,-1), intArrayOf(1,0), intArrayOf(1,1)
        )

        for (d in dirs) {
            var r = rMove + d[0]
            var c = cMove + d[1]
            var cnt = 0

            while (r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] == opposite) {
                r += d[0]
                c += d[1]
                cnt++
            }

            if (cnt >= 1 && r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] == color) {
                return true
            }
        }

        return false
    }
}
