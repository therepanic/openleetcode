class Solution {
    fun pyramidTransition(bottom: String, allowed: Array<String>): Boolean {
        return pyramidTransition(bottom, allowed.toList())
    }

    fun pyramidTransition(bottom: String, allowed: List<String>): Boolean {
        val tab = mutableMapOf<String, MutableSet<Char>>()
        for (a in allowed) {
            val key = "${a[0]}${a[1]}"
            tab.getOrPut(key) { mutableSetOf() }.add(a[2])
        }
        
        val visited = mutableSetOf<String>()
        
        fun addNeighbor(node: String): List<String> {
            var res = listOf("")
            for (i in 1 until node.length) {
                val key = "${node[i-1]}${node[i]}"
                val chars = tab[key] ?: return emptyList()
                res = res.flatMap { r -> chars.map { c -> r + c } }
            }
            return res
        }
        
        fun dfs(node: String): Boolean {
            if (node.length == 1) return true
            if (node in visited) return false
            
            for (nxt in addNeighbor(node)) {
                if (dfs(nxt)) return true
            }
            
            visited.add(node)
            return false
        }
        
        return dfs(bottom)
    }
}
