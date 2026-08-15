class Solution {
    fun numWays(s: String): Int {
        val MOD = 1_000_000_007
        val totalOnes = s.count { it == '1' }
        
        if (totalOnes == 0) {
            val n = s.length.toLong()
            return ((n - 1) * (n - 2) / 2 % MOD).toInt()
        }
        
        if (totalOnes % 3 != 0) return 0
        
        val onesPerPart = totalOnes / 3
        var firstSplitWays = 0L
        var secondSplitWays = 0L
        var count = 0
        
        for (c in s) {
            if (c == '1') count++
            if (count == onesPerPart) {
                firstSplitWays++
            } else if (count == 2 * onesPerPart) {
                secondSplitWays++
            }
        }
        
        return ((firstSplitWays * secondSplitWays) % MOD).toInt()
    }
}
