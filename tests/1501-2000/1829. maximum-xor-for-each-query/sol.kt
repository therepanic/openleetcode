class Solution {
    fun getMaximumXor(nums: IntArray, maximumBit: Int): IntArray {
        val n = nums.size
        val ans = IntArray(n)
        val mask = (1 shl maximumBit) - 1
        var curr = 0
        for (i in 0 until n) {
            curr = curr xor nums[i]
            ans[n - 1 - i] = mask xor curr
        }
        return ans
    }
}
