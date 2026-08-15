class Solution {
    fun minSkips(dist: IntArray, speed: Int, hoursBefore: Int): Int {
        val inf = 1e18.toLong()
        val n = dist.size
        var dp = LongArray(n + 1) { inf }
        dp[0] = 0
        for (i in 0 until n) {
            val nxt = LongArray(n + 1) { inf }
            for (skips in 0..i + 1) {
                if (dp[skips] >= inf) continue
                nxt[skips + 1] = minOf(nxt[skips + 1], dp[skips] + dist[i])
                var arrival = dp[skips] + dist[i]
                if (i != n - 1) {
                    arrival = ((arrival + speed - 1) / speed) * speed
                }
                nxt[skips] = minOf(nxt[skips], arrival)
            }
            dp = nxt
        }
        val limit = hoursBefore.toLong() * speed
        for (skips in 0..n) {
            if (dp[skips] <= limit) return skips
        }
        return -1
    }
}
