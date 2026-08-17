class Solution {
    fun minimumMountainRemovals(nums: IntArray): Int {
        val n = nums.size
        val lis = IntArray(n) { 1 }
        val lds = IntArray(n) { 1 }

        for (i in 0 until n) {
            for (j in 0 until i) {
                if (nums[i] > nums[j]) {
                    lis[i] = maxOf(lis[i], lis[j] + 1)
                }
            }
        }

        for (i in n - 1 downTo 0) {
            for (j in n - 1 downTo i + 1) {
                if (nums[i] > nums[j]) {
                    lds[i] = maxOf(lds[i], lds[j] + 1)
                }
            }
        }

        var maxLen = 0
        for (i in 1 until n - 1) {
            if (lis[i] > 1 && lds[i] > 1) {
                maxLen = maxOf(maxLen, lis[i] + lds[i] - 1)
            }
        }

        return n - maxLen
    }
}
