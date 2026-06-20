class Solution {
    fun fourSumCount(nums1: IntArray, nums2: IntArray, nums3: IntArray, nums4: IntArray): Int {
        val map = mutableMapOf<Int, Int>()
        for (a in nums1) {
            for (b in nums2) {
                val sum = a + b
                map[sum] = map.getOrDefault(sum, 0) + 1
            }
        }
        var count = 0
        for (c in nums3) {
            for (d in nums4) {
                count += map.getOrDefault(-(c + d), 0)
            }
        }
        return count
    }
}
