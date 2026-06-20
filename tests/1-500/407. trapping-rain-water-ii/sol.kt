import java.util.PriorityQueue

class Solution {
    fun trapRainWater(heightMap: Array<IntArray>): Int {
        if (heightMap.isEmpty() || heightMap.size < 3 || heightMap[0].size < 3) return 0

        val m = heightMap.size
        val n = heightMap[0].size
        val visited = Array(m) { BooleanArray(n) }
        val heap = PriorityQueue<Triple<Int, Int, Int>>(compareBy { it.first })

        for (i in 0 until m) {
            heap.offer(Triple(heightMap[i][0], i, 0))
            heap.offer(Triple(heightMap[i][n - 1], i, n - 1))
            visited[i][0] = true
            visited[i][n - 1] = true
        }
        for (j in 0 until n) {
            heap.offer(Triple(heightMap[0][j], 0, j))
            heap.offer(Triple(heightMap[m - 1][j], m - 1, j))
            visited[0][j] = true
            visited[m - 1][j] = true
        }

        var result = 0
        val directions = arrayOf(intArrayOf(0, 1), intArrayOf(1, 0), intArrayOf(0, -1), intArrayOf(-1, 0))

        while (heap.isNotEmpty()) {
            val (height, x, y) = heap.poll()

            for (dir in directions) {
                val nx = x + dir[0]
                val ny = y + dir[1]
                if (nx in 0 until m && ny in 0 until n && !visited[nx][ny]) {
                    result += maxOf(0, height - heightMap[nx][ny])
                    heap.offer(Triple(maxOf(height, heightMap[nx][ny]), nx, ny))
                    visited[nx][ny] = true
                }
            }
        }

        return result
    }
}
