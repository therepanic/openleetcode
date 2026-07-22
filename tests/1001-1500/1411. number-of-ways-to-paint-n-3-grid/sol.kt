class Solution {
    fun numOfWays(n: Int): Int {
        val MOD = 1000000007
        var x = 6L
        var y = 6L
        
        for (i in 2..n) {
            val newX = (3 * x + 2 * y) % MOD
            val newY = (2 * x + 2 * y) % MOD
            x = newX
            y = newY
        }
        
        return ((x + y) % MOD).toInt()
    }
}
