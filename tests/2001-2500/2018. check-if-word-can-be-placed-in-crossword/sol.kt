class Solution {
    fun placeWordInCrossword(board: Array<CharArray>, word: String): Boolean {
        fun canPlace(segment: String, w: String): Boolean {
            if (segment.length != w.length) return false
            for (i in segment.indices) {
                if (segment[i] != ' ' && segment[i] != w[i]) return false
            }
            return true
        }
        
        val m = board.size
        val n = board[0].size
        val reversedWord = word.reversed()
        
        for (row in board) {
            val parts = row.joinToString("").split("#")
            for (part in parts) {
                if (part.isNotEmpty() && (canPlace(part, word) || canPlace(part, reversedWord))) return true
            }
        }
        
        for (j in 0 until n) {
            val col = (0 until m).map { board[it][j] }.joinToString("")
            val parts = col.split("#")
            for (part in parts) {
                if (part.isNotEmpty() && (canPlace(part, word) || canPlace(part, reversedWord))) return true
            }
        }
        return false
    }
}
