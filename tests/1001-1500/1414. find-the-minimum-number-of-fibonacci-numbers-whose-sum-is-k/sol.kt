class Solution {
    fun findMinFibonacciNumbers(k: Int): Int {
        val fib = mutableListOf(1, 1)
        while (fib.last() <= k) {
            fib.add(fib[fib.size - 1] + fib[fib.size - 2])
        }
        
        var count = 0
        var i = fib.size - 1
        var remaining = k
        
        while (remaining > 0) {
            if (fib[i] <= remaining) {
                remaining -= fib[i]
                count++
            }
            i--
        }
        
        return count
    }
}
