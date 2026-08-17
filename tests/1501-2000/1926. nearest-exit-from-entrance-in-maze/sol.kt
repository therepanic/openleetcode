class Solution {
    fun nearestExit(maze: Array<CharArray>, entrance: IntArray): Int {
        val n = maze.size
        val m = maze[0].size
        val visited = Array(n) { BooleanArray(m) }
        val q = ArrayDeque<Triple<Int,Int,Int>>()
        q.add(Triple(entrance[0], entrance[1], 0))
        visited[entrance[0]][entrance[1]] = true
        val dirs = arrayOf(intArrayOf(-1,0), intArrayOf(1,0), intArrayOf(0,-1), intArrayOf(0,1))
        
        while(q.isNotEmpty()) {
            val (r, c, dist) = q.removeFirst()
            for(d in dirs) {
                val nr = r + d[0]
                val nc = c + d[1]
                if(nr >= 0 && nc >= 0 && nr < n && nc < m && !visited[nr][nc] && maze[nr][nc] == '.') {
                    visited[nr][nc] = true
                    if(nr == 0 || nc == 0 || nr == n-1 || nc == m-1) return dist+1
                    q.add(Triple(nr, nc, dist+1))
                }
            }
        }
        return -1
    }
}
