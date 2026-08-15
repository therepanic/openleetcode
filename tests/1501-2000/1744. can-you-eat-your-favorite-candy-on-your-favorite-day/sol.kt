class Solution {
    fun canEat(candiesCount: IntArray, queries: Array<IntArray>): BooleanArray {
        val n = candiesCount.size
        val m = queries.size
        val ans = BooleanArray(m)
        val psum = LongArray(n + 1)
        for (i in 1..n) {
            psum[i] = psum[i - 1] + candiesCount[i - 1]
        }
        for (i in 0 until m) {
            val t = queries[i][0]
            val day = queries[i][1].toLong()
            val cap = queries[i][2].toLong()
            val minDays = psum[t] / cap
            val maxDays = psum[t + 1] - 1
            ans[i] = (minDays <= day && day <= maxDays)
        }
        return ans
    }
}
