class Solution {
    private lateinit var boardRef: Array<CharArray>
    private lateinit var target: CharArray
    private var rows = 0
    private var cols = 0

    fun exist(board: Array<CharArray>, word: String): Boolean {
        boardRef = board
        target = word.toCharArray()
        rows = board.size
        cols = board[0].size

        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (boardRef[r][c] == target[0] && dfs(r, c, 0)) return true
            }
        }
        return false
    }

    private fun dfs(r: Int, c: Int, index: Int): Boolean {
        if (index == target.size) return true
        if (r !in 0 until rows || c !in 0 until cols || boardRef[r][c] != target[index]) return false

        val saved = boardRef[r][c]
        boardRef[r][c] = '#'
        val found =
            dfs(r + 1, c, index + 1) ||
                dfs(r - 1, c, index + 1) ||
                dfs(r, c + 1, index + 1) ||
                dfs(r, c - 1, index + 1)
        boardRef[r][c] = saved
        return found
    }
}
