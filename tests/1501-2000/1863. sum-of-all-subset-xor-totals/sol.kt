class Solution {
    fun subsetXORSum(nums: IntArray): Int {
        var total = 0
        for (num in nums) {
            total = total or num
        }
        return total * (1 shl (nums.size - 1))
    }
}
