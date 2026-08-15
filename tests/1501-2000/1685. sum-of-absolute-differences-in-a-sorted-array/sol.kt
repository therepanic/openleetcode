class Solution {
    fun getSumAbsoluteDifferences(nums: IntArray): IntArray {
        val n = nums.size
        val pref = IntArray(n)
        pref[0] = nums[0]
        for (i in 1 until n) pref[i] = pref[i-1] + nums[i]
        val ans = IntArray(n)
        for (i in 0 until n) {
            val left = if (i > 0) pref[i-1] else 0
            val right = pref[n-1] - pref[i]
            ans[i] = right - left + (2*i - n + 1) * nums[i]
        }
        return ans
    }
}
