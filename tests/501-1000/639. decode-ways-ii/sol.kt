class Solution {
    fun numDecodings(s: String): Int {
        val M = 1000000007
        val n = s.length - 1
        
        val d = mutableMapOf<String, Int>()
        for (i in 1..26) d[i.toString()] = 1
        for (i in 0..9) d["*$i"] = 1 + (if (i < 7) 1 else 0)
        d["*"] = 9
        d["**"] = 15
        d["1*"] = 9
        d["2*"] = 6
        
        val dp = LongArray(n + 2)
        dp[0] = d.getOrDefault(s[0].toString(), 0).toLong()
        dp[n + 1] = 1
        
        for (i in 0 until n) {
            val one = s[i + 1].toString()
            val two = s.substring(i, i + 2)
            
            var count = (d.getOrDefault(one, 0).toLong() * dp[i]) % M
            count = (count + d.getOrDefault(two, 0).toLong() * (if (i > 0) dp[i - 1] else 1)) % M
            dp[i + 1] = count
            
            if (dp[i + 1] == 0L) return 0
        }
        
        return dp[n].toInt()
    }
}
