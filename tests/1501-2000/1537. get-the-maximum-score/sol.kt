class Solution {
    fun maxSum(nums1: IntArray, nums2: IntArray): Int {
        var p1 = 0
        var p2 = 0
        var sum1 = 0L
        var sum2 = 0L
        var result = 0L
        while (p1 < nums1.size && p2 < nums2.size) {
            if (nums1[p1] == nums2[p2]) {
                result += maxOf(sum1, sum2) + nums1[p1]
                sum1 = 0
                sum2 = 0
                p1++
                p2++
            } else if (nums1[p1] < nums2[p2]) {
                sum1 += nums1[p1]
                p1++
            } else {
                sum2 += nums2[p2]
                p2++
            }
        }
        while (p1 < nums1.size) {
            sum1 += nums1[p1]
            p1++
        }
        while (p2 < nums2.size) {
            sum2 += nums2[p2]
            p2++
        }
        return ((result + maxOf(sum1, sum2)) % 1000000007L).toInt()
    }
}
