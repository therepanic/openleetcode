class Solution {
    fun countRoutes(locations: IntArray, start: Int, finish: Int, fuel: Int): Int {
        val MOD = 1000000007
        val n = locations.size
        val dp = Array(n) { IntArray(fuel + 1) }
        for (city in 0 until n) {
            dp[city][0] = if (city == finish) 1 else 0
        }
        for (left in 1..fuel) {
            for (city in 0 until n) {
                var total = if (city == finish) 1 else 0
                for (nxt in 0 until n) {
                    if (nxt != city) {
                        val cost = Math.abs(locations[nxt] - locations[city])
                        if (cost <= left) {
                            total = (total + dp[nxt][left - cost]) % MOD
                        }
                    }
                }
                dp[city][left] = total
            }
        }
        return dp[start][fuel]
    }
}
