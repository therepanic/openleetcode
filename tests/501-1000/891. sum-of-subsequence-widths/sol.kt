class Solution {
    fun sumSubseqWidths(nums: IntArray): Int {
        val mod = 1000000007
        nums.sort()
        val n = nums.size
        var ans = 0L
        var factor = 1L
        for (i in 0 until n) {
            ans = (ans + (nums[i] - nums[n - 1 - i]) * factor) % mod
            factor = (factor * 2) % mod
        }
        return ans.toInt()
    }
}
