class Solution {
    fun maxProduct(nums: IntArray): Int {
        var best = nums[0]
        var curMax = nums[0]
        var curMin = nums[0]
        for (i in 1 until nums.size) {
            val x = nums[i]
            if (x < 0) {
                val temp = curMax
                curMax = curMin
                curMin = temp
            }
            curMax = maxOf(x, curMax * x)
            curMin = minOf(x, curMin * x)
            best = maxOf(best, curMax)
        }
        return best
    }
}
