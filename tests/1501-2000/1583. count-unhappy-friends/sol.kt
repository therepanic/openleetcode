class Solution {
    fun unhappyFriends(n: Int, preferences: Array<IntArray>, pairs: Array<IntArray>): Int {
        val graph = IntArray(n)
        for (p in pairs) {
            graph[p[0]] = p[1]
            graph[p[1]] = p[0]
        }

        val rank = Array(n) { IntArray(n) }
        for (i in 0 until n) {
            for (j in preferences[i].indices) {
                rank[i][preferences[i][j]] = j
            }
        }

        var ans = 0
        for (u in 0 until n) {
            val v = graph[u]
            var unhappy = false
            for (a in preferences[u]) {
                if (a == v) break
                val av = graph[a]
                if (rank[a][u] < rank[a][av]) {
                    unhappy = true
                    break
                }
            }
            if (unhappy) ans++
        }
        return ans
    }
}
