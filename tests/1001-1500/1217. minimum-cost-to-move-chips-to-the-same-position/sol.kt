class Solution {
    fun minCostToMoveChips(position: IntArray): Int {
        var even = 0
        var odd = 0
        for (i in position) {
            if (i % 2 == 0) {
                even++
            } else {
                odd++
            }
        }
        return minOf(even, odd)
    }
}
