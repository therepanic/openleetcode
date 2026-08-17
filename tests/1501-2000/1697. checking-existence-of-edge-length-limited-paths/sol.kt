class Solution {
    fun distanceLimitedPathsExist(n: Int, edgeList: Array<IntArray>, queries: Array<IntArray>): BooleanArray {
        val parent = IntArray(n) { it }
        val rank = IntArray(n)
        
        fun find(start: Int): Int {
            var x = start
            while (parent[x] != x) {
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
        }
        
        fun union(x: Int, y: Int) {
            val xroot = find(x)
            val yroot = find(y)
            if (xroot == yroot) return
            if (rank[xroot] < rank[yroot]) {
                parent[xroot] = yroot
            } else if (rank[xroot] > rank[yroot]) {
                parent[yroot] = xroot
            } else {
                parent[yroot] = xroot
                rank[xroot]++
            }
        }
        
        val queriesWithIdx = Array(queries.size) { IntArray(4) }
        for (i in queries.indices) {
            queriesWithIdx[i][0] = queries[i][0]
            queriesWithIdx[i][1] = queries[i][1]
            queriesWithIdx[i][2] = queries[i][2]
            queriesWithIdx[i][3] = i
        }
        
        queriesWithIdx.sortBy { it[2] }
        edgeList.sortBy { it[2] }
        
        var i = 0
        val res = BooleanArray(queries.size)
        for (q in queriesWithIdx) {
            while (i < edgeList.size && edgeList[i][2] < q[2]) {
                union(edgeList[i][0], edgeList[i][1])
                i++
            }
            if (find(q[0]) == find(q[1])) {
                res[q[3]] = true
            }
        }
        return res
    }
}
