class Solution {
    fun numTimesAllBlue(flips: IntArray): Int {
        var res = 0
        var maxFlips = 0
        
        for (i in flips.indices) {
            maxFlips = maxOf(maxFlips, flips[i])
            if (maxFlips == i + 1) {
                res++
            }
        }
        
        return res
    }
}
