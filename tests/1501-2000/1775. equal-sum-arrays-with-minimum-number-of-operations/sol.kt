class Solution {
    fun minOperations(nums1: IntArray, nums2: IntArray): Int {
        val x = nums1.sum()
        val y = nums2.sum()
        if (x == y) return 0
        if (x < y) {
            if (6*nums1.size < nums2.size) return -1
            val gains = nums1.map { 6-it } + nums2.map { it-1 }
            val sorted = gains.sortedDescending()
            var diff = y - x
            var ops = 0
            for (g in sorted) {
                if (diff <= 0) break
                diff -= g
                ops++
            }
            return if (diff <= 0) ops else -1
        } else {
            if (6*nums2.size < nums1.size) return -1
            val gains = nums1.map { it-1 } + nums2.map { 6-it }
            val sorted = gains.sortedDescending()
            var diff = x - y
            var ops = 0
            for (g in sorted) {
                if (diff <= 0) break
                diff -= g
                ops++
            }
            return if (diff <= 0) ops else -1
        }
    }
}
