class Solution {
    fun findMedianSortedArrays(nums1: IntArray, nums2: IntArray): Double {
        if (nums1.size > nums2.size) {
            return findMedianSortedArrays(nums2, nums1)
        }

        val m = nums1.size
        val n = nums2.size
        val totalLeft = (m + n + 1) / 2
        var left = 0
        var right = m

        while (left <= right) {
            val i = (left + right) / 2
            val j = totalLeft - i

            val maxLeft1 = if (i == 0) Int.MIN_VALUE else nums1[i - 1]
            val minRight1 = if (i == m) Int.MAX_VALUE else nums1[i]
            val maxLeft2 = if (j == 0) Int.MIN_VALUE else nums2[j - 1]
            val minRight2 = if (j == n) Int.MAX_VALUE else nums2[j]

            if (maxLeft1 <= minRight2 && maxLeft2 <= minRight1) {
                val leftMax = maxOf(maxLeft1, maxLeft2)
                if (((m + n) and 1) == 1) {
                    return leftMax.toDouble()
                }
                val rightMin = minOf(minRight1, minRight2)
                return (leftMax.toLong() + rightMin.toLong()) / 2.0
            }

            if (maxLeft1 > minRight2) {
                right = i - 1
            } else {
                left = i + 1
            }
        }

        return 0.0
    }
}
