class Solution {
    fun getConcatenation(nums: IntArray): IntArray {
        val n = nums.size
        val ans = IntArray(2 * n)
        for (i in 0 until 2 * n) {
            ans[i] = nums[i % n]
        }
        return ans
    }
}
