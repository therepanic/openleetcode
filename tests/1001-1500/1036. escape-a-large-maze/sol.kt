class Solution {
    fun isEscapePossible(blocked: Array<IntArray>, source: IntArray, target: IntArray): Boolean {
        val blockedSet = blocked.map { "${it[0]},${it[1]}" }.toHashSet()
        val MAX = blocked.size * blocked.size / 2
        val dirs = arrayOf(intArrayOf(-1, 0), intArrayOf(1, 0), intArrayOf(0, -1), intArrayOf(0, 1))

        fun bfs(start: IntArray, end: IntArray): Boolean {
            val visited = HashSet<String>()
            val queue = ArrayDeque<IntArray>()
            queue.add(start)
            visited.add("${start[0]},${start[1]}")
            var count = 0

            while (queue.isNotEmpty()) {
                val cur = queue.removeFirst()
                val x = cur[0]
                val y = cur[1]
                if (x == end[0] && y == end[1]) return true
                if (count > MAX) return true

                for (dir in dirs) {
                    val nx = x + dir[0]
                    val ny = y + dir[1]
                    val key = "$nx,$ny"
                    if (nx in 0 until 1000000 && ny in 0 until 1000000 && key !in visited && key !in blockedSet) {
                        visited.add(key)
                        queue.add(intArrayOf(nx, ny))
                    }
                }
                count++
            }
            return false
        }

        return bfs(source, target) && bfs(target, source)
    }
}
