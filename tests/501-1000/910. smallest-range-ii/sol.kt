class Solution {
    fun smallestRangeII(nums: IntArray, k: Int): Int {
        nums.sort()
        val n = nums.size
        var ans = nums[n - 1] - nums[0]
        for (i in 0 until n - 1) {
            val high = maxOf(nums[n - 1] - k, nums[i] + k)
            val low = minOf(nums[0] + k, nums[i + 1] - k)
            ans = minOf(ans, high - low)
        }
        return ans
    }
}
