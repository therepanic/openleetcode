class Solution {
    fun findNumberOfLIS(nums: IntArray): Int {
        val n = nums.size
        if (n == 0) return 0

        val lengths = IntArray(n) { 1 }
        val counts = IntArray(n) { 1 }

        for (i in 0 until n) {
            for (j in 0 until i) {
                if (nums[j] < nums[i]) {
                    if (lengths[j] + 1 > lengths[i]) {
                        lengths[i] = lengths[j] + 1
                        counts[i] = counts[j]
                    } else if (lengths[j] + 1 == lengths[i]) {
                        counts[i] += counts[j]
                    }
                }
            }
        }

        val maxLength = lengths.maxOrNull() ?: 0
        return (0 until n)
            .filter { lengths[it] == maxLength }
            .sumOf { counts[it] }
    }
}
