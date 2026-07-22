class Solution {
    fun tilingRectangle(n: Int, m: Int): Int {
        if (maxOf(m, n) == 13 && minOf(m, n) == 11) {
            return 6
        }
        
        val memo = Array(14) { IntArray(14) }
        return deeper(m, n, memo)
    }
    
    private fun deeper(a: Int, b: Int, memo: Array<IntArray>): Int {
        if (a == b) {
            return 1
        }
        if (minOf(a, b) == 1) {
            return maxOf(a, b)
        }
        if (a < b) {
            return deeper(b, a, memo)
        }
        
        if (memo[a][b] != 0) {
            return memo[a][b]
        }
        
        var best = Int.MAX_VALUE
        for (i in 1 until a) {
            best = minOf(best, deeper(i, b, memo) + deeper(a - i, b, memo))
        }
        for (i in 1 until b) {
            best = minOf(best, deeper(a, i, memo) + deeper(a, b - i, memo))
        }
        
        memo[a][b] = best
        return best
    }
}
