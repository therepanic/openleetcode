class Solution {
    fun decompressRLElist(nums: IntArray): IntArray {
        var size = 0
        for (i in nums.indices step 2) {
            size += nums[i]
        }
        val a = IntArray(size)
        var idx = 0
        for (i in nums.indices step 2) {
            val freq = nums[i]
            val value = nums[i + 1]
            repeat(freq) {
                a[idx++] = value
            }
        }
        return a
    }
}
