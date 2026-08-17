class Solution {
    fun maxAscendingSum(nums: IntArray): Int {
        var curr = nums[0]
        var ans = nums[0]
        for (i in 1 until nums.size) {
            curr = if (nums[i] > nums[i-1]) curr + nums[i] else nums[i]
            ans = maxOf(ans, curr)
        }
        return ans
    }
}
