class Solution {
    fun countPrimeSetBits(left: Int, right: Int): Int {
        var count = 0
        for (i in left..right) {
            val setBits = Integer.bitCount(i)
            if (isPrime(setBits)) {
                count++
            }
        }
        return count
    }
    
    private fun isPrime(n: Int): Boolean {
        if (n <= 1) return false
        var i = 2
        while (i * i <= n) {
            if (n % i == 0) return false
            i++
        }
        return true
    }
}
