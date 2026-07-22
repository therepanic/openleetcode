class Solution {
    private class UnionFind(n: Int) {
        private val parent = IntArray(n) { it }
        fun findParent(p: Int): Int {
            if (parent[p] == p) return p
            parent[p] = findParent(parent[p])
            return parent[p]
        }
        fun union(u: Int, v: Int) {
            val pu = findParent(u)
            val pv = findParent(v)
            parent[pu] = pv
        }
    }

    private fun findMST(n: Int, edges: Array<IntArray>, block: Int, e: Int): Int {
        val uf = UnionFind(n)
        var weight = 0
        if (e != -1) {
            weight += edges[e][2]
            uf.union(edges[e][0], edges[e][1])
        }
        for (i in edges.indices) {
            if (i == block) continue
            if (uf.findParent(edges[i][0]) == uf.findParent(edges[i][1])) continue
            uf.union(edges[i][0], edges[i][1])
            weight += edges[i][2]
        }
        for (i in 0 until n) {
            if (uf.findParent(i) != uf.findParent(0)) return Int.MAX_VALUE
        }
        return weight
    }

    fun findCriticalAndPseudoCriticalEdges(n: Int, edges: Array<IntArray>): List<List<Int>> {
        val critical = mutableListOf<Int>()
        val pseudoCritical = mutableListOf<Int>()
        val m = edges.size
        val edgesWithIdx = Array(m) { IntArray(4) }
        for (i in 0 until m) {
            edgesWithIdx[i][0] = edges[i][0]
            edgesWithIdx[i][1] = edges[i][1]
            edgesWithIdx[i][2] = edges[i][2]
            edgesWithIdx[i][3] = i
        }
        edgesWithIdx.sortBy { it[2] }
        val mstwt = findMST(n, edgesWithIdx, -1, -1)
        for (i in 0 until m) {
            if (mstwt < findMST(n, edgesWithIdx, i, -1)) {
                critical.add(edgesWithIdx[i][3])
            } else if (mstwt == findMST(n, edgesWithIdx, -1, i)) {
                pseudoCritical.add(edgesWithIdx[i][3])
            }
        }
        return listOf(critical, pseudoCritical)
    }
}
