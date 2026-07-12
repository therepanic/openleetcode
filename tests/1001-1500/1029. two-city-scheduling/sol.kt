class Solution {
    fun twoCitySchedCost(costs: Array<IntArray>): Int {
        var res = 0
        costs.sortBy { it[0] - it[1] }
        val n = costs.size
        for (i in 0 until n) {
            if (i < n / 2) {
                res += costs[i][0]
            } else {
                res += costs[i][1]
            }
        }
        return res
    }
}
