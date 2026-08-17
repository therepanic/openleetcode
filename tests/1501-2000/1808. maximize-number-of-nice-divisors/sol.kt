class Solution {
    fun maxNiceDivisors(primeFactors: Int): Int {
        val MOD = 1_000_000_007L
        if (primeFactors == 1) return 1
        val q = primeFactors / 3
        val r = primeFactors % 3
        return when (r) {
            0 -> powMod(3L, q, MOD).toInt()
            1 -> (powMod(3L, q-1, MOD) * 4 % MOD).toInt()
            else -> (powMod(3L, q, MOD) * 2 % MOD).toInt()
        }
    }
    
    private fun powMod(a: Long, b: Int, mod: Long): Long {
        var result = 1L
        var base = a
        var exp = b
        while (exp > 0) {
            if (exp % 2 == 1) result = result * base % mod
            base = base * base % mod
            exp /= 2
        }
        return result
    }
}
