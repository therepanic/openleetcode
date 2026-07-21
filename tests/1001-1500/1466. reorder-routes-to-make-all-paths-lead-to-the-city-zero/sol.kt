class Solution {
    fun minReorder(n: Int, connections: Array<IntArray>): Int {
        val roads = HashSet<String>()
        val graph = Array(n) { mutableListOf<Int>() }
        for ((x, y) in connections) {
            graph[x].add(y)
            graph[y].add(x)
            roads.add("$x,$y")
        }
        
        val seen = BooleanArray(n)
        seen[0] = true
        fun dfs(node: Int): Int {
            var ans = 0
            for (neighbor in graph[node]) {
                if (!seen[neighbor]) {
                    if (roads.contains("$node,$neighbor")) {
                        ans++
                    }
                    seen[neighbor] = true
                    ans += dfs(neighbor)
                }
            }
            return ans
        }
        
        return dfs(0)
    }
}
