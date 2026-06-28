class Solution {
    fun pivotIndex(nums: IntArray): Int {
        val totalSum = nums.sum()
        var lSum = 0
        var rSum = totalSum
        for (i in nums.indices) {
            rSum -= nums[i]
            if (lSum == rSum) {
                return i
            }
            lSum += nums[i]
        }
        return -1
    }
}
