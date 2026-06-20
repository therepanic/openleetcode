class Solution {
    fun numberOfArithmeticSlices(nums: IntArray): Int {
        var c = 0
        var t = 2
        for (i in 1 until nums.size - 1) {
            if (nums[i-1] - nums[i] == nums[i] - nums[i+1]) {
                t++
            } else {
                t = 2
            }
            c += t - 2
        }
        return c
    }
}
