class Solution {
    fun updateMatrix(mat: Array<IntArray>): Array<IntArray> {
        val rows = mat.size
        val cols = mat[0].size
        val directions = arrayOf(intArrayOf(0, 1), intArrayOf(0, -1), intArrayOf(1, 0), intArrayOf(-1, 0))
        val queue = ArrayDeque<Pair<Int, Int>>()

        for (i in 0 until rows) {
            for (j in 0 until cols) {
                if (mat[i][j] == 0) {
                    queue.addLast(Pair(i, j))
                } else {
                    mat[i][j] = Int.MAX_VALUE
                }
            }
        }

        while (queue.isNotEmpty()) {
            val (row, col) = queue.removeFirst()

            for (dir in directions) {
                val newRow = row + dir[0]
                val newCol = col + dir[1]

                if (newRow in 0 until rows && newCol in 0 until cols && mat[newRow][newCol] > mat[row][col] + 1) {
                    mat[newRow][newCol] = mat[row][col] + 1
                    queue.addLast(Pair(newRow, newCol))
                }
            }
        }

        return mat
    }
}
