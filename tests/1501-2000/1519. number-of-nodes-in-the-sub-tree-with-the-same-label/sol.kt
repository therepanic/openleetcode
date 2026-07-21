class Solution {
    fun countSubTrees(n: Int, edges: Array<IntArray>, labels: String): IntArray {
        val matrix = Array(n) { mutableListOf<Int>() }
        for ((u, v) in edges) {
            matrix[u].add(v)
            matrix[v].add(u)
        }

        val parent = IntArray(n) { -1 }
        val order = mutableListOf(0)
        var idx = 0
        while (idx < order.size) {
            val node = order[idx]
            for (child in matrix[node]) {
                if (child != parent[node]) {
                    parent[child] = node
                    order.add(child)
                }
            }
            idx++
        }

        val counts = Array(n) { IntArray(26) }
        val ans = IntArray(n)
        for (i in order.size - 1 downTo 0) {
            val node = order[i]
            val label = labels[node] - 'a'
            counts[node][label]++
            ans[node] = counts[node][label]
            if (parent[node] != -1) {
                for (j in 0 until 26) {
                    counts[parent[node]][j] += counts[node][j]
                }
            }
        }
        return ans
    }
}
