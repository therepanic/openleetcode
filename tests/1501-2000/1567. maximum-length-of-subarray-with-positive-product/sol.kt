class Solution {
    fun getMaxLen(nums: IntArray): Int {
        var posLen = 0
        var negLen = 0
        var maxLen = 0
        for (num in nums) {
            when {
                num == 0 -> {
                    posLen = 0
                    negLen = 0
                }
                num > 0 -> {
                    posLen++
                    negLen = if (negLen > 0) negLen + 1 else 0
                }
                else -> {
                    val temp = posLen
                    posLen = if (negLen > 0) negLen + 1 else 0
                    negLen = temp + 1
                }
            }
            maxLen = maxOf(maxLen, posLen)
        }
        return maxLen
    }
}
