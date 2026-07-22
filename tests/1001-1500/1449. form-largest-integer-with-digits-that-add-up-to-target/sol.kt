class Solution {
    fun largestNumber(cost: IntArray, target: Int): String {
        val N = cost.size
        val memo = Array(N + 1) { IntArray(target + 1) { -1 } }
        
        fun helper(i: Int, c: Int): Int {
            if (c == 0) return 0
            if (i == N || c < 0) return Int.MIN_VALUE
            if (memo[i][c] != -1) return memo[i][c]
            val take = helper(i, c - cost[i])
            val notTake = helper(i + 1, c)
            val takeVal = if (take != Int.MIN_VALUE) take + 1 else Int.MIN_VALUE
            memo[i][c] = maxOf(takeVal, notTake)
            return memo[i][c]
        }
        
        val e = helper(0, target)
        if (e == Int.MIN_VALUE) return "0"
        
        var t = target
        val sb = StringBuilder()
        for (k in 0 until e) {
            for (j in 9 downTo 1) {
                if (cost[j-1] <= t && helper(0, t - cost[j-1]) == e - k - 1) {
                    t -= cost[j-1]
                    sb.append(j)
                    break
                }
            }
        }
        return sb.toString()
    }
}
