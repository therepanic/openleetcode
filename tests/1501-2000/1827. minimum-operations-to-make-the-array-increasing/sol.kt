class Solution {
    fun minOperations(nums: IntArray): Int {
        var c = nums[0]
        var s = 0
        for (i in 1 until nums.size) {
            if (nums[i] > c) {
                c = nums[i]
            } else {
                c++
                s += c - nums[i]
            }
        }
        return s
    }
}
