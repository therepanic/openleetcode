class Solution {
    fun numRookCaptures(board: Array<CharArray>): Int {
        var pwa = 0
        for (i in 0 until 8) {
            for (j in 0 until 8) {
                if (board[i][j] == 'R') {
                    for (k in i - 1 downTo 0) {
                        if (board[k][j] == 'B') {
                            break
                        } else if (board[k][j] == 'p') {
                            pwa++
                            break
                        }
                    }
                    for (k in i + 1 until 8) {
                        if (board[k][j] == 'B') {
                            break
                        } else if (board[k][j] == 'p') {
                            pwa++
                            break
                        }
                    }
                    for (k in j + 1 until 8) {
                        if (board[i][k] == 'B') {
                            break
                        } else if (board[i][k] == 'p') {
                            pwa++
                            break
                        }
                    }
                    for (k in j - 1 downTo 0) {
                        if (board[i][k] == 'B') {
                            break
                        } else if (board[i][k] == 'p') {
                            pwa++
                            break
                        }
                    }
                }
            }
        }
        return pwa
    }
}
