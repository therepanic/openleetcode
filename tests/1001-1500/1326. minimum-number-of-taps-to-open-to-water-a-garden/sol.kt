class Solution {
    fun minTaps(n: Int, ranges: IntArray): Int {
        val maxRange = IntArray(n + 1)
        
        for (i in ranges.indices) {
            val left = maxOf(0, i - ranges[i])
            val right = minOf(n, i + ranges[i])
            maxRange[left] = maxOf(maxRange[left], right)
        }
        
        var end = 0
        var farthest = 0
        var taps = 0
        var i = 0
        
        while (end < n) {
            while (i <= end) {
                farthest = maxOf(farthest, maxRange[i])
                i++
            }
            
            if (farthest <= end) {
                return -1
            }
            
            end = farthest
            taps++
        }
        
        return taps
    }
}
