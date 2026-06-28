class Solution {
    fun findMinMoves(machines: IntArray): Int {
        val n = machines.size
        val total = machines.sum()
        if (total % n != 0) {
            return -1
        }
        val avg = total / n
        val imbalances = machines.map { it - avg }
        var res = 0
        var d = 0
        for (imb in imbalances) {
            res = maxOf(res, Math.abs(d))
            res = maxOf(res, imb)
            d += imb
        }
        return res
    }
}
