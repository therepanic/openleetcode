class Solution {
    fun imageSmoother(img: Array<IntArray>): Array<IntArray> {
        val m = img.size
        val n = img[0].size
        val P = Array(m + 1) { IntArray(n + 1) }
        for (i in 1..m) {
            for (j in 1..n) {
                P[i][j] = img[i-1][j-1] + P[i-1][j] + P[i][j-1] - P[i-1][j-1]
            }
        }
        val res = Array(m) { IntArray(n) }
        for (i in 0 until m) {
            for (j in 0 until n) {
                val a = maxOf(0, i - 1)
                val b = maxOf(0, j - 1)
                val c = minOf(m - 1, i + 1)
                val d = minOf(n - 1, j + 1)
                val s = P[c+1][d+1] - P[a][d+1] - P[c+1][b] + P[a][b]
                res[i][j] = s / ((c - a + 1) * (d - b + 1))
            }
        }
        return res
    }
}
