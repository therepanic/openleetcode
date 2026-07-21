class Solution {
    fun getProbability(balls: IntArray): Double {
        val sm = balls.sum()
        val expanded = mutableListOf<Int>()
        balls.forEachIndexed { i, ball -> repeat(ball) { expanded.add(i) } }
        
        val memo = mutableMapOf<String, Long>()
        
        fun dp(i: Int, cnt0: Int, mask0: Int, mask1: Int): Long {
            val key = "$i,$cnt0,$mask0,$mask1"
            memo[key]?.let { return it }
            
            val cnt1 = i - cnt0
            if (cnt0 > sm / 2 || cnt1 > sm / 2) {
                memo[key] = 0
                return 0
            }
            
            if (i == expanded.size) {
                val result = if (mask0.countOneBits() == mask1.countOneBits()) 1L else 0L
                memo[key] = result
                return result
            }
            
            val result = dp(i + 1, cnt0 + 1, mask0 or (1 shl expanded[i]), mask1) +
                         dp(i + 1, cnt0, mask0, mask1 or (1 shl expanded[i]))
            memo[key] = result
            return result
        }
        
        val favorable = dp(0, 0, 0, 0)
        val total = comb(sm.toLong(), (sm / 2).toLong())
        return favorable.toDouble() / total.toDouble()
    }
    
    private fun comb(n: Long, k: Long): Long {
        var res = 1L
        for (i in 1..k) {
            res = res * (n - k + i) / i
        }
        return res
    }
}
