class Solution {
    fun getCoprimes(nums: IntArray, edges: Array<IntArray>): IntArray {
        val n = nums.size
        val adj = Array(n) { mutableListOf<Int>() }
        for (e in edges) {
            adj[e[0]].add(e[1])
            adj[e[1]].add(e[0])
        }
        val ans = IntArray(n) { -1 }
        val depth = IntArray(n)
        val ancestorByValue = IntArray(51) { -1 }
        dfs(0, 0, 0, nums, adj, ans, depth, ancestorByValue)
        return ans
    }
    
    private fun dfs(node: Int, prev: Int, dep: Int, nums: IntArray, adj: Array<MutableList<Int>>, ans: IntArray, depth: IntArray, ancestorByValue: IntArray) {
        depth[node] = dep
        var best = Int.MAX_VALUE
        var bestAnc = -1
        for (i in 1..50) {
            if (gcd(i, nums[node]) == 1) {
                val anc = ancestorByValue[i]
                if (anc != -1) {
                    val diff = dep - depth[anc]
                    if (diff < best) {
                        best = diff
                        bestAnc = anc
                    }
                }
            }
        }
        ans[node] = bestAnc
        val prevState = ancestorByValue[nums[node]]
        ancestorByValue[nums[node]] = node
        for (v in adj[node]) {
            if (v != prev) dfs(v, node, dep + 1, nums, adj, ans, depth, ancestorByValue)
        }
        ancestorByValue[nums[node]] = prevState
    }
    
    private fun gcd(a: Int, b: Int): Int = if (b == 0) a else gcd(b, a % b)
}
