class Solution {
    fun stoneGameV(stoneValue: IntArray): Int {
        val n = stoneValue.size
        val sv = IntArray(n + 1)
        for (i in 0 until n) sv[i + 1] = sv[i] + stoneValue[i]
        val memo = Array(n + 1) { IntArray(n + 1) { -1 } }
        return helper(sv, 0, n, memo)
    }
    
    private fun helper(sv: IntArray, fro: Int, to: Int, memo: Array<IntArray>): Int {
        if (to - fro == 1) return 0
        if (memo[fro][to] != -1) return memo[fro][to]
        
        val target = (sv[to] + sv[fro]) / 2
        var lo = fro
        var hi = to
        while (lo < hi) {
            val mid = (lo + hi) / 2
            if (sv[mid] < target) lo = mid + 1 else hi = mid
        }
        val mid = lo
        
        var dist = 0
        var res = 0
        var exploreMore = true
        while (exploreMore) {
            exploreMore = false
            for (i in intArrayOf(mid - dist, mid + dist)) {
                if (fro < i && i <= to) {
                    val left = sv[i] - sv[fro]
                    val right = sv[to] - sv[i]
                    if (res / 2 <= left && left <= right) {
                        res = maxOf(res, left + helper(sv, fro, i, memo))
                        exploreMore = true
                    }
                    if (left >= right && right >= res / 2) {
                        res = maxOf(res, right + helper(sv, i, to, memo))
                        exploreMore = true
                    }
                }
            }
            dist++
        }
        memo[fro][to] = res
        return res
    }
}
