class Solution {
    fun maxNumEdgesToRemove(n: Int, edges: Array<IntArray>): Int {
        edges.sortByDescending { it[0] }
        val parentA = IntArray(n + 1) { it }
        val parentB = IntArray(n + 1) { it }
        val rankA = IntArray(n + 1)
        val rankB = IntArray(n + 1)

        fun find(parent: IntArray, x: Int): Int {
            if (parent[x] != x) {
                parent[x] = find(parent, parent[x])
            }
            return parent[x]
        }

        fun union(parent: IntArray, rank: IntArray, x: Int, y: Int): Boolean {
            val rootX = find(parent, x)
            val rootY = find(parent, y)
            if (rootX == rootY) return false
            if (rank[rootX] < rank[rootY]) {
                parent[rootX] = rootY
            } else if (rank[rootX] > rank[rootY]) {
                parent[rootY] = rootX
            } else {
                parent[rootX] = rootY
                rank[rootY]++
            }
            return true
        }

        var removed = 0
        var aliceEdges = 0
        var bobEdges = 0
        for (e in edges) {
            when (e[0]) {
                3 -> {
                    if (union(parentA, rankA, e[1], e[2])) {
                        union(parentB, rankB, e[1], e[2])
                        aliceEdges++
                        bobEdges++
                    } else {
                        removed++
                    }
                }
                2 -> {
                    if (union(parentB, rankB, e[1], e[2])) {
                        bobEdges++
                    } else {
                        removed++
                    }
                }
                else -> {
                    if (union(parentA, rankA, e[1], e[2])) {
                        aliceEdges++
                    } else {
                        removed++
                    }
                }
            }
        }
        return if (bobEdges == n - 1 && aliceEdges == n - 1) removed else -1
    }
}
