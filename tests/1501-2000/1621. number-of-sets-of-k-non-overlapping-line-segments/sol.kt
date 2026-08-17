class Solution {
    fun numberOfSets(n: Int, k: Int): Int {
        val MOD = 1_000_000_007L
        var dpPrev = LongArray(n) { 1L }
        
        var prefixPrev = LongArray(n)
        prefixPrev[0] = dpPrev[0]
        for (i in 1 until n) {
            prefixPrev[i] = (prefixPrev[i-1] + dpPrev[i]) % MOD
        }
        
        repeat(k) {
            val dpCur = LongArray(n)
            for (i in 1 until n) {
                dpCur[i] = (dpCur[i-1] + prefixPrev[i-1]) % MOD
            }
            dpPrev = dpCur
            prefixPrev[0] = dpPrev[0]
            for (i in 1 until n) {
                prefixPrev[i] = (prefixPrev[i-1] + dpPrev[i]) % MOD
            }
        }
        
        return dpPrev[n-1].toInt()
    }
}
