class Solution {
    fun minJumps(arr: IntArray): Int {
        val n = arr.size
        if (n == 1) return 0
        
        val mp = mutableMapOf<Int, MutableList<Int>>()
        for (i in arr.indices) {
            mp.getOrPut(arr[i]) { mutableListOf() }.add(i)
        }
        
        val q = ArrayDeque<Pair<Int, Int>>()
        q.addLast(0 to 0)
        val vis = BooleanArray(n)
        vis[0] = true
        
        while (q.isNotEmpty()) {
            val (node, dist) = q.removeFirst()
            if (node == n - 1) return dist
            
            if (node - 1 >= 0 && !vis[node - 1]) {
                vis[node - 1] = true
                q.addLast(node - 1 to dist + 1)
            }
            if (node + 1 < n && !vis[node + 1]) {
                vis[node + 1] = true
                q.addLast(node + 1 to dist + 1)
            }
            
            mp[arr[node]]?.forEach { nxt ->
                if (!vis[nxt]) {
                    vis[nxt] = true
                    q.addLast(nxt to dist + 1)
                }
            }
            mp[arr[node]]?.clear()
        }
        return -1
    }
}
