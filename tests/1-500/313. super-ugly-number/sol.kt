class Solution {
    fun nthSuperUglyNumber(n: Int, primes: IntArray): Int {
        val ugly = IntArray(n)
        ugly[0] = 1
        val idx = IntArray(primes.size)
        val vals = LongArray(primes.size) { primes[it].toLong() }
        for (i in 1 until n) {
            var m = vals[0]
            for (j in 1 until vals.size) {
                if (vals[j] < m) {
                    m = vals[j]
                }
            }
            ugly[i] = m.toInt()
            for (j in primes.indices) {
                if (vals[j] == m) {
                    idx[j]++
                    vals[j] = ugly[idx[j]].toLong() * primes[j].toLong()
                }
            }
        }
        return ugly[n - 1]
    }
}
