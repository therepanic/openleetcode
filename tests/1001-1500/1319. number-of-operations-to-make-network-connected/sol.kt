class Solution {
    fun makeConnected(n: Int, connections: Array<IntArray>): Int {
        if (connections.size < n - 1) return -1

        val parent = IntArray(n) { it }
        val size = IntArray(n) { 1 }

        fun find(node: Int): Int {
            if (parent[node] != node) {
                parent[node] = find(parent[node])
            }
            return parent[node]
        }

        fun union(u: Int, v: Int) {
            val pu = find(u)
            val pv = find(v)
            if (pu == pv) return
            if (size[pu] < size[pv]) {
                parent[pu] = pv
                size[pv] += size[pu]
            } else {
                parent[pv] = pu
                size[pu] += size[pv]
            }
        }

        var extra = 0
        for ((u, v) in connections) {
            if (find(u) == find(v)) {
                extra++
            } else {
                union(u, v)
            }
        }

        val components = (0 until n).count { find(it) == it }
        return if (extra >= components - 1) components - 1 else -1
    }
}
