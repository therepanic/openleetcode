class Solution {
    fun findLengthOfLCIS(nums: IntArray): Int {
        var ptr1 = 0
        var ptr2 = 1
        val n = nums.size
        if (n == 0) return 0
        var maxLenSubseq = 1
        while (ptr2 < n) {
            while (ptr2 < n && nums[ptr2] > nums[ptr2 - 1]) {
                ptr2++
            }
            maxLenSubseq = maxOf(maxLenSubseq, ptr2 - ptr1)
            ptr1 = ptr2
            ptr2++
        }
        return maxLenSubseq
    }
}
