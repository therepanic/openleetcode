class Solution {
    fun maxSatisfaction(satisfaction: IntArray): Int {
        satisfaction.sortDescending()
        var presum = 0
        var res = 0
        for (s in satisfaction) {
            presum += s
            if (presum < 0) break
            res += presum
        }
        return res
    }
}
