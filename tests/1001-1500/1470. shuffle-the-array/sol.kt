class Solution {
    fun shuffle(nums: IntArray, n: Int): IntArray {
        val ans = IntArray(2 * n)
        for (i in 0 until 2 * n) {
            if (i % 2 == 0) {
                ans[i] = nums[i / 2]
            } else {
                ans[i] = nums[n + i / 2]
            }
        }
        return ans
    }
}
