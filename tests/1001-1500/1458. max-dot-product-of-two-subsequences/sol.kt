class Solution {
    private lateinit var memo: Array<IntArray>
    private lateinit var nums1: IntArray
    private lateinit var nums2: IntArray
    
    fun maxDotProduct(nums1: IntArray, nums2: IntArray): Int {
        this.nums1 = nums1
        this.nums2 = nums2
        memo = Array(nums1.size) { IntArray(nums2.size) { Int.MIN_VALUE } }
        return dp(0, 0)
    }
    
    private fun dp(i: Int, j: Int): Int {
        if (i == nums1.size || j == nums2.size) {
            return Int.MIN_VALUE
        }
        if (memo[i][j] != Int.MIN_VALUE) {
            return memo[i][j]
        }
        
        val take = nums1[i] * nums2[j]
        var res = take
        val takeAndContinue = dp(i+1, j+1)
        if (takeAndContinue != Int.MIN_VALUE) {
            res = maxOf(res, take + takeAndContinue)
        }
        res = maxOf(res, dp(i+1, j))
        res = maxOf(res, dp(i, j+1))
        
        memo[i][j] = res
        return res
    }
}
