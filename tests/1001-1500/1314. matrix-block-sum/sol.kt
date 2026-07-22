class Solution {
    fun matrixBlockSum(mat: Array<IntArray>, k: Int): Array<IntArray> {
        val n = mat.size
        val m = mat[0].size
        val pre = Array(n) { IntArray(m) }
        val ans = Array(n) { IntArray(m) }
        
        for (i in 0 until n) {
            for (j in 0 until m) {
                var sum = mat[i][j]
                if (i - 1 >= 0) sum += pre[i-1][j]
                if (j - 1 >= 0) sum += pre[i][j-1]
                if (i - 1 >= 0 && j - 1 >= 0) sum -= pre[i-1][j-1]
                pre[i][j] = sum
            }
        }
        
        for (i in 0 until n) {
            for (j in 0 until m) {
                val i1 = maxOf(0, i - k)
                val i2 = minOf(n - 1, i + k)
                val j1 = maxOf(0, j - k)
                val j2 = minOf(m - 1, j + k)
                var sum = pre[i2][j2]
                if (i1 - 1 >= 0) sum -= pre[i1-1][j2]
                if (j1 - 1 >= 0) sum -= pre[i2][j1-1]
                if (i1 - 1 >= 0 && j1 - 1 >= 0) sum += pre[i1-1][j1-1]
                ans[i][j] = sum
            }
        }
        return ans
    }
}
