class Solution {
    fun smallestStringWithSwaps(s: String, pairs: Array<IntArray>): String {
        val n = s.length
        val parent = IntArray(n) { it }
        
        fun find(x: Int): Int {
            if (parent[x] != x) {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }
        
        fun union(x: Int, y: Int) {
            val rx = find(x)
            val ry = find(y)
            if (rx != ry) {
                parent[rx] = ry
            }
        }
        
        for (pair in pairs) {
            union(pair[0], pair[1])
        }
        
        val groups = mutableMapOf<Int, MutableList<Int>>()
        for (i in 0 until n) {
            val root = find(i)
            groups.getOrPut(root) { mutableListOf() }.add(i)
        }
        
        val res = CharArray(n)
        for (indices in groups.values) {
            val chars = indices.map { s[it] }.toMutableList()
            indices.sort()
            chars.sort()
            for (k in indices.indices) {
                res[indices[k]] = chars[k]
            }
        }
        
        return String(res)
    }
}
