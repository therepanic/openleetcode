class Solution {
    fun sumOfBeauties(nums: IntArray): Int {
        val n = nums.size
        val prefix = IntArray(n)
        val suffix = IntArray(n)
        prefix[0] = nums[0]
        suffix[n-1] = nums[n-1]
        for (i in 1 until n) {
            prefix[i] = maxOf(nums[i-1], prefix[i-1])
        }
        for (i in n-2 downTo 0) {
            suffix[i] = minOf(nums[i+1], suffix[i+1])
        }
        var ans = 0
        for (i in 1 until n-1) {
            if (prefix[i] < nums[i] && nums[i] < suffix[i]) {
                ans += 2
            } else if (nums[i-1] < nums[i] && nums[i] < nums[i+1]) {
                ans += 1
            }
        }
        return ans
    }
}
