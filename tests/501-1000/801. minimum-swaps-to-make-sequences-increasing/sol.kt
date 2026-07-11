class Solution {
    fun minSwap(nums1: IntArray, nums2: IntArray): Int {
        val n = nums1.size
        var keep = 0
        var swap = 1
        
        for (i in 1 until n) {
            val inc = nums1[i] > nums1[i - 1] && nums2[i] > nums2[i - 1]
            val cross = nums1[i] > nums2[i - 1] && nums2[i] > nums1[i - 1]
            
            if (inc && cross) {
                val m = minOf(keep, swap)
                keep = m
                swap = m + 1
            } else if (inc) {
                swap += 1
            } else {
                val temp = keep
                keep = swap
                swap = temp + 1
            }
        }
        
        return minOf(keep, swap)
    }
}
