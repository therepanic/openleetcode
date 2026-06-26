class Solution {
    fun findCircleNum(isConnected: Array<IntArray>): Int {
        val n = isConnected.size
        val visited = BooleanArray(n) { false }
        var count = 0

        fun dfs(city: Int) {
            for (neighbor in 0 until n) {
                if (isConnected[city][neighbor] == 1 && !visited[neighbor]) {
                    visited[neighbor] = true
                    dfs(neighbor)
                }
            }
        }

        for (city in 0 until n) {
            if (!visited[city]) {
                visited[city] = true
                dfs(city)
                count++
            }
        }

        return count
    }
}
