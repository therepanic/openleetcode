class Solution {
    fun kLengthApart(nums: IntArray, k: Int): Boolean {
        if (k == 0) {
            return true
        }
        var prev: Int? = null
        for (i in nums.indices) {
            if (nums[i] == 1) {
                if (prev != null && i - prev!! <= k) {
                    return false
                }
                prev = i
            }
        }
        return true
    }
}
