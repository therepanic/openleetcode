class Solution {
    fun kWeakestRows(mat: Array<IntArray>, k: Int): IntArray {
        val d = mutableMapOf<Int, Int>()
        for (i in mat.indices) {
            d[i] = mat[i].sum()
        }
        return d.entries.sortedWith(compareBy({ it.value }, { it.key }))
            .take(k)
            .map { it.key }
            .toIntArray()
    }
}
