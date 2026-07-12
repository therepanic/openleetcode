class Solution {
    fun shipWithinDays(weights: IntArray, days: Int): Int {
        var low = weights.max()
        var high = weights.sum()

        while (low <= high) {
            val mid = (low + high) / 2

            var requiredDays = 1
            var load = 0

            for (weight in weights) {
                if (load + weight > mid) {
                    requiredDays++
                    load = weight
                } else {
                    load += weight
                }
            }

            if (requiredDays <= days) {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }

        return low
    }
}
