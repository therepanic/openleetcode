class Solution {
    fun missingNumber(nums: IntArray): Int {
        val l = nums.size
        var total = l
        var summ = 0
        for (i in 0 until l) {
            total += i
            summ += nums[i]
        }
        return total - summ
    }
}
