class Solution {
    fun kthSmallest(mat: Array<IntArray>, k: Int): Int {
        var sums = mat[0].take(k).toIntArray()
        for (i in 1 until mat.size) {
            val row = mat[i].take(k)
            val next = mutableListOf<Int>()
            for (a in sums) {
                for (b in row) {
                    next.add(a + b)
                }
            }
            next.sort()
            sums = next.take(k).toIntArray()
        }
        return sums[k - 1]
    }
}
