class Solution {
    fun maxRotateFunction(nums: IntArray): Int {
        val n = nums.size
        var totalSum = 0
        var F = 0
        for (i in 0 until n) {
            totalSum += nums[i]
            F += i * nums[i]
        }
        var result = F
        for (k in 1 until n) {
            F = F + totalSum - n * nums[n - k]
            result = maxOf(result, F)
        }
        return result
    }
}
