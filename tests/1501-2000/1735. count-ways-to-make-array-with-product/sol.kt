class Solution {
    private val MOD = 1_000_000_007
    
    fun waysToFillArray(queries: Array<IntArray>): IntArray {
        val result = IntArray(queries.size)
        queries.forEachIndexed { idx, q ->
            val n = q[0]
            val k = q[1]
            val factors = primeFactors(k)
            var total = 1L
            for (cnt in factors.values) {
                total = total * comb(n + cnt - 1, n - 1) % MOD
            }
            result[idx] = total.toInt()
        }
        return result
    }
    
    private fun primeFactors(n: Int): HashMap<Int, Int> {
        val map = HashMap<Int, Int>()
        var num = n
        var p = 2
        while (p * p <= num) {
            while (num % p == 0) {
                map[p] = (map[p] ?: 0) + 1
                num /= p
            }
            p++
        }
        if (num > 1) map[num] = (map[num] ?: 0) + 1
        return map
    }
    
    private fun comb(n: Int, r: Int): Long {
        val rr = minOf(r, n - r)
        var result = 1L
        for (i in 1..rr) result = result * (n - i + 1) % MOD * modPow(i.toLong(), MOD - 2) % MOD
        return result
    }

    private fun modPow(base: Long, exponent: Int): Long { var a = base; var e = exponent; var r = 1L; while (e > 0) { if (e and 1 == 1) r = r * a % MOD; a = a * a % MOD; e = e ushr 1 }; return r }
}
