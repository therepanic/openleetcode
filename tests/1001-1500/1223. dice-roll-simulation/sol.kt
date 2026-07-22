class Solution {
    fun dieSimulator(n: Int, rollMax: IntArray): Int {
        val MOD = 1_000_000_007
        val faces = 6

        val f = Array(n) { LongArray(faces) }
        val s = LongArray(n)

        for (j in 0 until faces) {
            f[0][j] = 1
        }
        s[0] = faces.toLong()

        for (i in 1 until n) {
            for (j in 0 until faces) {
                val maxRepeat = rollMax[j]
                var res = s[i - 1]

                if (i > maxRepeat) {
                    res -= (s[i - maxRepeat - 1] - f[i - maxRepeat - 1][j])
                } else if (i == maxRepeat) {
                    res -= 1
                }

                f[i][j] = ((res % MOD) + MOD) % MOD
            }
            var sum = 0L
            for (j in 0 until faces) {
                sum = (sum + f[i][j]) % MOD
            }
            s[i] = sum
        }

        return s[n - 1].toInt()
    }
}
