class Solution {
    fun countPrimes(n: Int): Int {
        if (n <= 2) return 0
        val isPrime = BooleanArray(n) { true }
        isPrime[0] = false
        isPrime[1] = false
        var i = 2
        while (i * i < n) {
            if (isPrime[i]) {
                var j = i * i
                while (j < n) {
                    isPrime[j] = false
                    j += i
                }
            }
            i++
        }
        return isPrime.count { it }
    }
}
