import kotlin.math.abs

class Solution {
    fun minAbsoluteSumDiff(nums1: IntArray, nums2: IntArray): Int {
        val MOD = 1_000_000_007
        val n = nums1.size
        val sortedNums1 = nums1.copyOf().sorted()
        var total = 0L
        var maxReduction = 0L
        
        for (i in 0 until n) {
            val a = nums1[i]
            val b = nums2[i]
            val currDiff = abs(a - b).toLong()
            total += currDiff
            
            var idx = sortedNums1.binarySearch(b)
            if (idx < 0) idx = -idx - 1
            
            if (idx < n) {
                maxReduction = maxOf(maxReduction, currDiff - abs(sortedNums1[idx] - b).toLong())
            }
            if (idx > 0) {
                maxReduction = maxOf(maxReduction, currDiff - abs(sortedNums1[idx - 1] - b).toLong())
            }
        }
        
        return ((total - maxReduction) % MOD).toInt()
    }
}
