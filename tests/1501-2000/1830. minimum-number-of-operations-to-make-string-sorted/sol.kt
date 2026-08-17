class Solution {
    fun makeStringSorted(s: String): Int {
        val MOD = 1_000_000_007
        val n = s.length
        val fac = LongArray(n + 1)
        val invFac = LongArray(n + 1)
        fac[0] = 1
        for (i in 1..n) {
            fac[i] = (fac[i - 1] * i) % MOD
        }
        invFac[n] = modPow(fac[n], (MOD - 2).toLong(), MOD)
        for (i in n downTo 1) {
            invFac[i - 1] = (invFac[i] * i) % MOD
        }
        
        val freq = IntArray(26)
        for (c in s) {
            freq[c - 'a']++
        }
        
        var ans = 0L
        for (i in 0 until n) {
            var smallRight = 0
            for (j in 0 until s[i] - 'a') {
                smallRight = (smallRight + freq[j]) % MOD
            }
            
            val rem = n - i - 1
            var temp = 1L
            temp = (temp * fac[rem]) % MOD
            temp = (temp * smallRight) % MOD
            
            for (x in freq) {
                if (x > 1) {
                    temp = (temp * invFac[x]) % MOD
                }
            }
            
            freq[s[i] - 'a']--
            ans = (ans + temp) % MOD
        }
        
        return ans.toInt()
    }
    
    private fun modPow(x: Long, n: Long, mod: Int): Long {
        if (x == 1L || n == 0L) return 1L
        if (n == 1L) return x % mod
        if (n % 2L == 1L) {
            return (x * modPow((x * x) % mod, n / 2, mod)) % mod
        }
        return modPow((x * x) % mod, n / 2, mod) % mod
    }
}
