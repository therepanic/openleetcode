class Solution {
    fun productExceptSelf(nums: IntArray): IntArray {
        val n = nums.size
        val res = IntArray(n)

        var pre = 1
        for (i in 0 until n) {
            res[i] = pre
            pre *= nums[i]
        }

        var suf = 1
        for (i in n - 1 downTo 0) {
            res[i] *= suf
            suf *= nums[i]
        }

        return res
    }
}
