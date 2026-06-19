class Solution {
    fun findRadius(houses: IntArray, heaters: IntArray): Int {
        houses.sort()
        heaters.sort()
        var radius = 0
        for (house in houses) {
            var left = 0
            var right = heaters.size - 1
            while (left < right) {
                val mid = (left + right) / 2
                if (heaters[mid] < house) {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            var dist = Math.abs(heaters[left] - house)
            if (left > 0) {
                dist = Math.min(dist, Math.abs(heaters[left - 1] - house))
            }
            radius = Math.max(radius, dist)
        }
        return radius
    }
}
