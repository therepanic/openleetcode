class Solution {
    fun strangePrinter(s: String): Int {
        val n = s.length
        val memo = Array(n) { arrayOfNulls<Int>(n) }
        return minTurns(s, 0, n - 1, memo)
    }
    
    private fun minTurns(s: String, start: Int, end: Int, memo: Array<Array<Int?>>): Int {
        if (start > end) {
            return 0
        }
        
        if (memo[start][end] != null) {
            return memo[start][end]!!
        }
        
        var res = minTurns(s, start, end - 1, memo) + 1
        
        for (middle in start until end) {
            if (s[middle] == s[end]) {
                res = minOf(res, minTurns(s, start, middle, memo) + minTurns(s, middle + 1, end - 1, memo))
            }
        }
        
        memo[start][end] = res
        return res
    }
}
