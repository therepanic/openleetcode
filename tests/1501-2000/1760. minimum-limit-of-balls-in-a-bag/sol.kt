class Solution {
    fun minimumSize(nums: IntArray, maxOperations: Int): Int {
        var lo = 1
        var hi = nums.max()!!
        while (lo < hi) {
            val mid = (lo + hi) / 2
            var needed = 0L
            for (x in nums) needed += (x - 1) / mid
            if (needed <= maxOperations) hi = mid
            else lo = mid + 1
        }
        return lo
    }
}
