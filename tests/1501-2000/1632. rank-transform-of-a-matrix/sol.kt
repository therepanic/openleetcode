class Solution {
    fun matrixRankTransform(matrix: Array<IntArray>): Array<IntArray> {
        val m = matrix.size
        val n = matrix[0].size
        val mp = mutableMapOf<Int, MutableList<Pair<Int, Int>>>()
        for (i in 0 until m) {
            for (j in 0 until n) {
                mp.getOrPut(matrix[i][j]) { mutableListOf() }.add(i to j)
            }
        }
        
        val rank = IntArray(m+n)
        val ans = Array(m) { IntArray(n) }
        
        for (k in mp.keys.sorted()) {
            val parent = IntArray(m+n) { it }
            fun find(p: Int): Int {
                if (p != parent[p]) parent[p] = find(parent[p])
                return parent[p]
            }
            
            for ((i, j) in mp[k]!!) {
                val ii = find(i)
                val jj = find(m+j)
                parent[ii] = jj
                rank[jj] = maxOf(rank[ii], rank[jj])
            }
            
            val seen = mutableSetOf<Int>()
            for ((i, j) in mp[k]!!) {
                val ii = find(i)
                if (ii !in seen) rank[ii] += 1
                seen.add(ii)
                val v = rank[ii]
                rank[i] = v
                rank[m+j] = v
                ans[i][j] = v
            }
        }
        return ans
    }
}
