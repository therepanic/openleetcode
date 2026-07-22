class Solution {
    fun minCost(houses: IntArray, cost: Array<IntArray>, m: Int, n: Int, target: Int): Int {
        val INF = Int.MAX_VALUE / 2
        var prev = Array(n) { IntArray(target + 1) { INF } }
        if (houses[0] != 0) {
            val c = houses[0] - 1
            prev[c][1] = 0
        } else {
            for (c in 0 until n) {
                prev[c][1] = cost[0][c]
            }
        }
        for (i in 1 until m) {
            val curr = Array(n) { IntArray(target + 1) { INF } }
            if (houses[i] != 0) {
                val c = houses[i] - 1
                val add = 0
                for (k in 1..target) {
                    if (prev[c][k] < INF) {
                        if (prev[c][k] + add < curr[c][k]) {
                            curr[c][k] = prev[c][k] + add
                        }
                    }
                    if (k > 1) {
                        var best = INF
                        for (pc in 0 until n) {
                            if (pc != c && prev[pc][k - 1] < best) {
                                best = prev[pc][k - 1]
                            }
                        }
                        if (best < INF && best + add < curr[c][k]) {
                            curr[c][k] = best + add
                        }
                    }
                }
            } else {
                for (c in 0 until n) {
                    val add = cost[i][c]
                    for (k in 1..target) {
                        if (prev[c][k] < INF) {
                            if (prev[c][k] + add < curr[c][k]) {
                                curr[c][k] = prev[c][k] + add
                            }
                        }
                        if (k > 1) {
                            var best = INF
                            for (pc in 0 until n) {
                                if (pc != c && prev[pc][k - 1] < best) {
                                    best = prev[pc][k - 1]
                                }
                            }
                            if (best < INF && best + add < curr[c][k]) {
                                curr[c][k] = best + add
                            }
                        }
                    }
                }
            }
            prev = curr
        }
        var ans = INF
        for (c in 0 until n) {
            if (prev[c][target] < ans) {
                ans = prev[c][target]
            }
        }
        return if (ans >= INF) -1 else ans
    }
}
