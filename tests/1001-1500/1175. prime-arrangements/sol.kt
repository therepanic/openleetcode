class Solution {
    companion object {
        private const val MOD = 1000000007L
        private val isPrime = BooleanArray(101) { true }
        private val prefixPrime = IntArray(101)
        
        init {
            isPrime[0] = false
            isPrime[1] = false
            for (i in 2..100) {
                if (i * i <= 100 && isPrime[i]) {
                    for (j in i * i..100 step i) {
                        isPrime[j] = false
                    }
                }
            }
            for (i in 2..100) {
                prefixPrime[i] = prefixPrime[i - 1] + (if (isPrime[i]) 1 else 0)
            }
        }
    }
    
    fun numPrimeArrangements(n: Int): Int {
        val x = prefixPrime[n]
        val y = n - x
        var proX = 1L
        var proY = 1L
        
        for (i in 2..x) {
            proX = (proX * i) % MOD
        }
        for (i in 2..y) {
            proY = (proY * i) % MOD
        }
        
        return ((proX * proY) % MOD).toInt()
    }
}
