class Solution {
    fun maxDistance(nums1: IntArray, nums2: IntArray): Int {
        var i = 0
        var j = 0
        var ans = 0
        while (i < nums1.size && j < nums2.size) {
            if (nums1[i] <= nums2[j]) {
                ans = maxOf(ans, j - i)
                j++
            } else {
                i++
                if (i > j) j = i
            }
        }
        return ans
    }
}
