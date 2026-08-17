class Solution {
    fun maxTaxiEarnings(n: Int, rides: Array<IntArray>): Long {
        rides.sortBy { it[1] }
        val dp = mutableListOf<LongArray>(longArrayOf(0, 0))
        
        for (ride in rides) {
            val start = ride[0].toLong()
            val end = ride[1].toLong()
            val tip = ride[2].toLong()
            
            var lo = 0
            var hi = dp.size
            while (lo < hi) {
                val mid = lo + (hi - lo) / 2
                if (dp[mid][0] <= start) {
                    lo = mid + 1
                } else {
                    hi = mid
                }
            }
            val i = lo - 1
            val profit = dp[i][1] + end - start + tip
            
            if (profit > dp.last()[1]) {
                dp.add(longArrayOf(end, profit))
            }
        }
        
        return dp.last()[1]
    }
}
