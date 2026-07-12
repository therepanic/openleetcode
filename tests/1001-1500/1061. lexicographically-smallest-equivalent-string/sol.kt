class Solution {
    fun smallestEquivalentString(s1: String, s2: String, baseStr: String): String {
        val adj = mutableMapOf<Char, MutableList<Char>>()
        for (i in s1.indices) {
            val a = s1[i]
            val b = s2[i]
            adj.getOrPut(a) { mutableListOf() }.add(b)
            adj.getOrPut(b) { mutableListOf() }.add(a)
        }

        fun dfs(ch: Char, visited: MutableSet<Char>): Char {
            visited.add(ch)
            var minCh = ch
            for (nei in adj[ch] ?: emptyList()) {
                if (nei !in visited) {
                    val candidate = dfs(nei, visited)
                    if (candidate < minCh) minCh = candidate
                }
            }
            return minCh
        }

        val result = StringBuilder()
        for (ch in baseStr) {
            val visited = mutableSetOf<Char>()
            result.append(dfs(ch, visited))
        }
        return result.toString()
    }
}
