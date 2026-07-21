class Solution {
    fun reconstructMatrix(upper: Int, lower: Int, colsum: IntArray): List<List<Int>> {
        if (upper + lower != colsum.sum()) return emptyList()
        val n = colsum.size
        val row1 = MutableList(n) { 0 }
        val row2 = MutableList(n) { 0 }
        var u = upper
        var l = lower
        
        for (i in 0 until n) {
            when (colsum[i]) {
                2 -> {
                    row1[i] = 1
                    row2[i] = 1
                    u--
                    l--
                }
                1 -> {
                    if (u > l) {
                        row1[i] = 1
                        u--
                    } else {
                        row2[i] = 1
                        l--
                    }
                }
            }
        }
        
        return if (l == 0 && u == 0) listOf(row1, row2) else emptyList()
    }
}
