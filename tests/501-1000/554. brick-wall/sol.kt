class Solution {
    fun leastBricks(wall: List<List<Int>>): Int {
        val edgeCounts = mutableMapOf<Int, Int>()
        for (row in wall) {
            var edge = 0
            for (i in 0 until row.size - 1) {
                edge += row[i]
                edgeCounts[edge] = edgeCounts.getOrDefault(edge, 0) + 1
            }
        }
        val maxEdges = edgeCounts.values.maxOrNull() ?: 0
        return wall.size - maxEdges
    }
}
