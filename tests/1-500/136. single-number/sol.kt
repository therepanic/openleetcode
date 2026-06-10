class Solution {
    fun singleNumber(nums: IntArray): Int {
        var result = 0
        for (num in nums) result = result xor num
        return result
    }
}
