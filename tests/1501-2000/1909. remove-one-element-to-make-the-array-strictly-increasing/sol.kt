class Solution {
    fun canBeIncreasing(nums: IntArray): Boolean {
        val n = nums.size
        var idx = -1
        
        for (i in 0 until n - 1) {
            if (nums[i] >= nums[i + 1]) {
                idx = i
                break
            }
        }
        
        var flag = true
        for (i in idx + 1 until n - 1) {
            if (nums[i] >= nums[i + 1]) {
                flag = false
                break
            }
        }
        
        if ((idx == 0 || idx == n - 1) && flag) return true
        if (idx - 1 >= 0 && idx + 1 < n && nums[idx - 1] < nums[idx + 1] && flag) return true
        
        for (i in n - 1 downTo 1) {
            if (nums[i] <= nums[i - 1]) {
                idx = i
                break
            }
        }
        
        flag = true
        for (i in idx - 1 downTo 1) {
            if (nums[i] <= nums[i - 1]) {
                flag = false
                break
            }
        }
        
        if ((idx == 0 || idx == n - 1) && flag) return true
        if (idx - 1 >= 0 && idx + 1 < n && nums[idx - 1] >= nums[idx + 1]) return false
        return flag
    }
}
