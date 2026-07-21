class Solution {
    fun oddCells(m: Int, n: Int, indices: Array<IntArray>): Int {
        val a = Array(m) { IntArray(n) { 0 } }
        var c = 0
        for (k in indices) {
            for (u in 0 until n) {
                a[k[0]][u]++
            }
            for (l in 0 until m) {
                a[l][k[1]]++
            }
        }
        for (i in 0 until m) {
            for (j in 0 until n) {
                if (a[i][j] % 2 != 0) {
                    c++
                }
            }
        }
        return c
    }
}
