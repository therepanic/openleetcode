class Solution {
    fun hitBricks(grid: Array<IntArray>, hits: Array<IntArray>): IntArray {
        val m = grid.size
        val n = grid[0].size
        val parent = IntArray(m * n + 1) { it }
        val rank = IntArray(m * n + 1) { 1 }
        
        val seen = mutableSetOf<Int>()
        for (hit in hits) {
            val i = hit[0]
            val j = hit[1]
            if (grid[i][j] == 1) {
                seen.add(i * n + j)
                grid[i][j] = 0
            }
        }
        
        fun find(p: Int): Int {
            if (p != parent[p]) {
                parent[p] = find(parent[p])
            }
            return parent[p]
        }
        
        fun union(p: Int, q: Int): Boolean {
            var rootP = find(p)
            var rootQ = find(q)
            if (rootP == rootQ) return false
            if (rank[rootP] > rank[rootQ]) {
                val tmp = rootP
                rootP = rootQ
                rootQ = tmp
            }
            parent[rootP] = rootQ
            rank[rootQ] += rank[rootP]
            return true
        }
        
        for (j in 0 until n) {
            if (grid[0][j] == 1) {
                union(j, m * n)
            }
        }
        
        for (i in 0 until m) {
            for (j in 0 until n) {
                if (grid[i][j] == 1) {
                    if (i > 0 && grid[i-1][j] == 1) {
                        union(i * n + j, (i-1) * n + j)
                    }
                    if (j > 0 && grid[i][j-1] == 1) {
                        union(i * n + j, i * n + j - 1)
                    }
                }
            }
        }
        
        val ans = IntArray(hits.size)
        var prevStable = rank[find(m * n)]
        val dirs = arrayOf(intArrayOf(1,0), intArrayOf(-1,0), intArrayOf(0,1), intArrayOf(0,-1))
        
        for (idx in hits.indices.reversed()) {
            val i = hits[idx][0]
            val j = hits[idx][1]
            if (seen.contains(i * n + j)) {
                grid[i][j] = 1
                if (i == 0) {
                    union(j, m * n)
                }
                for (dir in dirs) {
                    val ii = i + dir[0]
                    val jj = j + dir[1]
                    if (ii in 0 until m && jj in 0 until n && grid[ii][jj] == 1) {
                        union(i * n + j, ii * n + jj)
                    }
                }
                val currStable = rank[find(m * n)]
                ans[idx] = maxOf(0, currStable - prevStable - 1)
                prevStable = currStable
            } else {
                ans[idx] = 0
            }
        }
        
        return ans
    }
}
