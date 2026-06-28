class Solution {
    fun findRedundantConnection(edges: Array<IntArray>): IntArray {
        val n = edges.size
        val matrix = Array(n + 1) { mutableListOf<Int>() }
        for ((a, b) in edges) {
            matrix[a].add(b)
            matrix[b].add(a)
        }

        val visited = mutableSetOf<Int>()
        val path = mutableSetOf<Int>()
        var cycleStart = -1

        fun dfs(i: Int, parent: Int): Boolean {
            if (i in visited) return false
            visited.add(i)
            for (node in matrix[i]) {
                if (node !in visited) {
                    if (dfs(node, i)) {
                        if (cycleStart != -1) {
                            path.add(node)
                        }
                        if (node == cycleStart) {
                            cycleStart = -1
                        }
                        return true
                    }
                } else if (node != parent) {
                    path.add(node)
                    cycleStart = node
                    return true
                }
            }
            return false
        }

        for (i in n downTo 1) {
            if (dfs(i, -1)) break
        }

        for (k in n - 1 downTo 0) {
            val (a, b) = edges[k]
            if (a in path && b in path) {
                return intArrayOf(a, b)
            }
        }
        return intArrayOf()
    }
}
