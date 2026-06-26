class Solution {
    fun checkSubarraySum(nums: IntArray, k: Int): Boolean {
        if (nums.isEmpty()) return false

        var prefixSum = 0
        val remainderMap = mutableMapOf(0 to -1)

        for (i in nums.indices) {
            prefixSum += nums[i]
            val remainder = prefixSum % k

            if (remainderMap.containsKey(remainder)) {
                if (i - remainderMap[remainder]!! > 1) return true
            } else {
                remainderMap[remainder] = i
            }
        }

        return false
    }
}
