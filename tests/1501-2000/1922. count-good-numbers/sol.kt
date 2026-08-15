class Solution {
    fun countGoodNumbers(n: Long): Int {
        val mod = 1_000_000_007L
        val evenPositions = (n + 1) / 2
        val oddPositions = n / 2
        
        val evenWays = chakraPower(5, evenPositions, mod)
        val oddWays = chakraPower(4, oddPositions, mod)
        
        return ((evenWays * oddWays) % mod).toInt()
    }
    
    private fun chakraPower(base: Long, power: Long, mod: Long): Long {
        var result = 1L
        var b = base % mod
        var p = power
        while (p > 0) {
            if (p % 2 == 1L) {
                result = (result * b) % mod
            }
            b = (b * b) % mod
            p /= 2
        }
        return result
    }
}
