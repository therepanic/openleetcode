class Solution {
    fun maxSubarraySumCircular(nums: IntArray): Int {
        var maxSum = nums[0]
        var minSum = nums[0]
        var currMaxSum = nums[0]
        var currMinSum = nums[0]
        var totalSum = nums[0]
        
        for (i in 1 until nums.size) {
            currMaxSum = maxOf(currMaxSum + nums[i], nums[i])
            maxSum = maxOf(maxSum, currMaxSum)
            
            currMinSum = minOf(currMinSum + nums[i], nums[i])
            minSum = minOf(minSum, currMinSum)
            
            totalSum += nums[i]
        }
        
        val circularSum = totalSum - minSum
        
        if (circularSum == 0) {
            return maxSum
        }
        
        return maxOf(maxSum, circularSum)
    }
}
