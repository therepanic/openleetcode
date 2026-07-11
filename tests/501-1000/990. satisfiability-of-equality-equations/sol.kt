class Solution {
    fun equationsPossible(equations: Array<String>): Boolean {
        val parent = IntArray(26) { it }
        val rank = IntArray(26)

        fun find(x: Int): Int {
            if (parent[x] != x) {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }

        fun union(a: Int, b: Int) {
            val ra = find(a)
            val rb = find(b)
            if (ra == rb) return
            when {
                rank[ra] < rank[rb] -> parent[ra] = rb
                rank[ra] > rank[rb] -> parent[rb] = ra
                else -> {
                    parent[rb] = ra
                    rank[ra]++
                }
            }
        }

        for (eq in equations) {
            if (eq[1] == '=') {
                union(eq[0] - 'a', eq[3] - 'a')
            }
        }

        for (eq in equations) {
            if (eq[1] == '!' && find(eq[0] - 'a') == find(eq[3] - 'a')) {
                return false
            }
        }
        return true
    }
}
