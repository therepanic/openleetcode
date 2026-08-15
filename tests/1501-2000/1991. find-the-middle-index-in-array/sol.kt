class Solution {
    fun findMiddleIndex(nums: IntArray): Int {
        val total = nums.sum()
        var leftSum = 0
        var rightSum = total
        
        for (i in nums.indices) {
            rightSum -= nums[i]
            if (leftSum == rightSum) return i
            leftSum += nums[i]
        }
        
        return -1
    }
}
