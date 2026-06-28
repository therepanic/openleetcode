class Solution {
    fun checkPossibility(nums: IntArray): Boolean {
        var cntViolations = 0
        for (i in 1 until nums.size) {
            if (nums[i] < nums[i - 1]) {
                if (cntViolations == 1) {
                    return false
                }
                cntViolations++
                if (i >= 2 && nums[i - 2] > nums[i]) {
                    nums[i] = nums[i - 1]
                }
            }
        }
        return true
    }
}
