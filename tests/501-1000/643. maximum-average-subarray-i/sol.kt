class Solution {
    fun findMaxAverage(nums: IntArray, k: Int): Double {
        var windowSum = nums.take(k).sum()
        var maxSum = windowSum
        
        for (i in k until nums.size) {
            windowSum = windowSum - nums[i - k] + nums[i]
            maxSum = maxOf(maxSum, windowSum)
        }
        
        return maxSum.toDouble() / k
    }
}
