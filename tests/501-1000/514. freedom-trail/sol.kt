class Solution {
    private fun dist(size: Int, p: Int, t: Int): Int {
        return minOf(Math.abs(t - p), size - Math.abs(t - p))
    }
    
    fun findRotateSteps(ring: String, key: String): Int {
        val mp = Array(26) { IntArray(100) }
        val freq = IntArray(26)
        val dp = Array(100) { IntArray(100) }
        
        val n = ring.length
        val m = key.length
        
        for (i in 0 until n) {
            val idx = ring[i] - 'a'
            mp[idx][freq[idx]] = i
            freq[idx]++
        }
        
        val firstChar = key[0] - 'a'
        for (i in 0 until freq[firstChar]) {
            dp[0][mp[firstChar][i]] = dist(n, 0, mp[firstChar][i]) + 1
        }
        
        for (i in 1 until m) {
            val prevChar = key[i - 1] - 'a'
            val currChar = key[i] - 'a'
            for (j in 0 until freq[currChar]) {
                var mini = Int.MAX_VALUE
                for (k in 0 until freq[prevChar]) {
                    mini = minOf(mini, dp[i - 1][mp[prevChar][k]] +
                                dist(n, mp[currChar][j], mp[prevChar][k]) + 1)
                }
                dp[i][mp[currChar][j]] = mini
            }
        }
        
        val lastChar = key[m - 1] - 'a'
        var res = Int.MAX_VALUE
        for (i in 0 until freq[lastChar]) {
            res = minOf(res, dp[m - 1][mp[lastChar][i]])
        }
        
        return res
    }
}
