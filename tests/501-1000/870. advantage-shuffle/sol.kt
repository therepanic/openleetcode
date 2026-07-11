class Solution {
    fun advantageCount(nums1: IntArray, nums2: IntArray): IntArray {
        val n = nums1.size
        nums1.sort()
        
        val nums2Sorted = nums2.mapIndexed { index, value -> Pair(value, index) }
            .sortedBy { it.first }
        
        val res = IntArray(n)
        var left = 0
        var right = n - 1
        
        for (i in n - 1 downTo 0) {
            if (nums1[right] > nums2Sorted[i].first) {
                res[nums2Sorted[i].second] = nums1[right]
                right--
            } else {
                res[nums2Sorted[i].second] = nums1[left]
                left++
            }
        }
        
        return res
    }
}
