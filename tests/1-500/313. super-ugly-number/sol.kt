class Solution {
    fun nthSuperUglyNumber(n: Int, primes: IntArray): Int {
        val ugly = IntArray(n)
        ugly[0] = 1
        val idx = IntArray(primes.size)
        val vals = IntArray(primes.size) { primes[it] }
        for (i in 1 until n) {
            val m = vals.minOrNull()!!
            ugly[i] = m
            for (j in primes.indices) {
                if (vals[j] == m) {
                    idx[j]++
                    vals[j] = ugly[idx[j]] * primes[j]
                }
            }
        }
        return ugly[n - 1]
    }
}
