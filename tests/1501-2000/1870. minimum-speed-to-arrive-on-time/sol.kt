class Solution {
    fun minSpeedOnTime(dist: IntArray, hour: Double): Int {
        if (dist.isEmpty()) return -1
        
        fun canReach(speed: Int): Boolean {
            var total = 0.0
            for (i in 0 until dist.size - 1) {
                total += (dist[i] + speed - 1) / speed
            }
            total += dist.last().toDouble() / speed
            return total <= hour
        }
        
        var low = 1
        var high = 10000000
        var ans = -1
        while (low <= high) {
            val mid = (low + high) / 2
            if (canReach(mid)) {
                ans = mid
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return ans
    }
}
