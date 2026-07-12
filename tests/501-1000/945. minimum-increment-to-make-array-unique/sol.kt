class Solution {
    fun minIncrementForUnique(nums: IntArray): Int {
        nums.sort()
        var res = 0
        for (i in 1 until nums.size) {
            if (nums[i] <= nums[i - 1]) {
                val target = nums[i - 1] + 1
                res += target - nums[i]
                nums[i] = target
            }
        }
        return res
    }
}
