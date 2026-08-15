class Solution {
    private lateinit var adj: Array<MutableList<Int>>
    private lateinit var count: Array<IntArray>
    private lateinit var vis: IntArray
    private lateinit var colors: String
    
    fun largestPathValue(colors: String, edges: Array<IntArray>): Int {
        this.colors = colors
        val n = colors.length
        adj = Array(n) { mutableListOf() }
        edges.forEach { e ->
            adj[e[0]].add(e[1])
        }
        count = Array(n) { IntArray(26) }
        vis = IntArray(n)
        
        var ans = 0
        for (i in 0 until n) {
            val value = dfs(i)
            if (value == Int.MAX_VALUE) return -1
            ans = maxOf(ans, value)
        }
        return ans
    }
    
    private fun dfs(node: Int): Int {
        if (vis[node] == 1) return Int.MAX_VALUE
        if (vis[node] == 2) return count[node][colors[node] - 'a']
        
        vis[node] = 1
        for (nxt in adj[node]) {
            val res = dfs(nxt)
            if (res == Int.MAX_VALUE) return Int.MAX_VALUE
            for (c in 0 until 26) {
                count[node][c] = maxOf(count[node][c], count[nxt][c])
            }
        }
        
        val col = colors[node] - 'a'
        count[node][col]++
        vis[node] = 2
        return count[node][col]
    }
}
