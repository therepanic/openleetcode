class Solution {
    fun minEatingSpeed(piles: IntArray, h: Int): Int {
        fun canFinish(k: Int): Boolean {
            var hours = 0
            for (pile in piles) {
                hours += pile / k
                if (pile % k != 0) {
                    hours++
                }
                if (hours > h) {
                    return false
                }
            }
            return true
        }

        var left = 1
        var right = piles.max()
        var ans = right
        while (left <= right) {
            val mid = left + (right - left) / 2
            if (canFinish(mid)) {
                ans = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return ans
    }
}
