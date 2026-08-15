class Solution {
    fun areConnected(n: Int, threshold: Int, queries: Array<IntArray>): List<Boolean> {
        var limit = n
        for (q in queries) {
            limit = maxOf(limit, maxOf(q[0], q[1]))
        }
        val parent = IntArray(limit + 1) { it }
        val rank = IntArray(limit + 1) { 1 }

        fun find(x: Int): Int {
            var res = x
            while (res != parent[res]) {
                parent[res] = parent[parent[res]]
                res = parent[res]
            }
            return res
        }

        fun union(a: Int, b: Int): Boolean {
            val p1 = find(a)
            val p2 = find(b)
            if (p1 == p2) return false
            if (rank[p1] > rank[p2]) {
                parent[p2] = p1
                rank[p1] += rank[p2]
            } else {
                parent[p1] = p2
                rank[p2] += rank[p1]
            }
            return true
        }

        for (i in threshold + 1..limit) {
            for (j in 2 * i..limit step i) {
                union(i, j)
            }
        }

        return queries.map { find(it[0]) == find(it[1]) }
    }
}
