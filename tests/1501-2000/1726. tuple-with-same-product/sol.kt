class Solution {
    fun tupleSameProduct(nums: IntArray): Int {
        val productCount = mutableMapOf<Int, Int>()
        var ans = 0

        for (i in nums.indices) {
            for (j in i+1 until nums.size) {
                val product = nums[i] * nums[j]
                ans += 8 * (productCount[product] ?: 0)
                productCount[product] = (productCount[product] ?: 0) + 1
            }
        }

        return ans
    }
}
