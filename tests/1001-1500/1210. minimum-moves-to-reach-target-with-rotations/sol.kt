class Solution {
    fun minimumMoves(grid: Array<IntArray>): Int {
        val n = grid.size
        val target = intArrayOf(n - 1, n - 2, 0)
        
        val queue = ArrayDeque<Pair<IntArray, Int>>()
        queue.add(Pair(intArrayOf(0, 0, 0), 0))
        val visited = Array(n) { Array(n) { BooleanArray(2) } }
        visited[0][0][0] = true
        
        while (queue.isNotEmpty()) {
            val (state, dist) = queue.removeFirst()
            val r = state[0]
            val c = state[1]
            val o = state[2]
            
            if (r == target[0] && c == target[1] && o == target[2]) {
                return dist
            }
            
            if (o == 0) {
                if (c + 2 < n && grid[r][c + 2] == 0) {
                    if (!visited[r][c + 1][0]) {
                        visited[r][c + 1][0] = true
                        queue.add(Pair(intArrayOf(r, c + 1, 0), dist + 1))
                    }
                }
                if (r + 1 < n && grid[r + 1][c] == 0 && grid[r + 1][c + 1] == 0) {
                    if (!visited[r + 1][c][0]) {
                        visited[r + 1][c][0] = true
                        queue.add(Pair(intArrayOf(r + 1, c, 0), dist + 1))
                    }
                }
            } else {
                if (c + 1 < n && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0) {
                    if (!visited[r][c + 1][1]) {
                        visited[r][c + 1][1] = true
                        queue.add(Pair(intArrayOf(r, c + 1, 1), dist + 1))
                    }
                }
                if (r + 2 < n && grid[r + 2][c] == 0) {
                    if (!visited[r + 1][c][1]) {
                        visited[r + 1][c][1] = true
                        queue.add(Pair(intArrayOf(r + 1, c, 1), dist + 1))
                    }
                }
            }
            
            if (r + 1 < n && c + 1 < n &&
                grid[r + 1][c] == 0 && grid[r][c + 1] == 0 && grid[r + 1][c + 1] == 0) {
                val newO = 1 - o
                if (!visited[r][c][newO]) {
                    visited[r][c][newO] = true
                    queue.add(Pair(intArrayOf(r, c, newO), dist + 1))
                }
            }
        }
        
        return -1
    }
}
