class Solution {
    fun minSwapsCouples(row: IntArray): Int {
        val n = row.size / 2
        val parent = IntArray(n) { it }
        
        fun find(x: Int): Int {
            if (parent[x] != x) {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }
        
        fun union(a: Int, b: Int) {
            val pa = find(a)
            val pb = find(b)
            if (pa != pb) {
                parent[pa] = pb
            }
        }
        
        for (i in row.indices step 2) {
            val couple1 = row[i] / 2
            val couple2 = row[i+1] / 2
            union(couple1, couple2)
        }
        
        val componentSize = mutableMapOf<Int, Int>()
        for (couple in 0 until n) {
            val root = find(couple)
            componentSize[root] = componentSize.getOrDefault(root, 0) + 1
        }
        
        var swaps = 0
        for (size in componentSize.values) {
            swaps += size - 1
        }
        
        return swaps
    }
}
