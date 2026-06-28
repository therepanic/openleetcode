class Solution {
    private val MOD = 1_000_000_007L

    private fun multiply(A: Array<LongArray>, B: Array<LongArray>): Array<LongArray> {
        val C = Array(3) { LongArray(3) }
        for (i in 0..2) {
            for (j in 0..2) {
                var s = 0L
                for (k in 0..2) {
                    s = (s + A[i][k] * B[k][j]) % MOD
                }
                C[i][j] = s
            }
        }
        return C
    }

    private fun power(base: Array<LongArray>, exp: Int): Array<LongArray> {
        var result = arrayOf(
            longArrayOf(1, 0, 0),
            longArrayOf(0, 1, 0),
            longArrayOf(0, 0, 1)
        )
        var b = base
        var e = exp
        while (e > 0) {
            if ((e and 1) == 1) {
                result = multiply(result, b)
            }
            b = multiply(b, b)
            e = e shr 1
        }
        return result
    }

    fun numTilings(n: Int): Int {
        if (n == 0) return 1
        if (n == 1) return 1
        if (n == 2) return 2
        val t = arrayOf(
            longArrayOf(2, 0, 1),
            longArrayOf(1, 0, 0),
            longArrayOf(0, 1, 0)
        )
        val p = power(t, n - 2)
        return ((p[0][0] * 2 + p[0][1] + p[0][2]) % MOD).toInt()
    }
}
