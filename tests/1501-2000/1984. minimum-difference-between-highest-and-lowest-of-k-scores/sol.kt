class Solution {
    fun minimumDifference(nums: IntArray, k: Int): Int {
        nums.sort()
        val n = nums.size
        var ans = nums[k - 1] - nums[0]
        for (i in 0..n - k) {
            ans = minOf(ans, nums[i + k - 1] - nums[i])
        }
        return ans
    }
}
