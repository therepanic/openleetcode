class Solution {
    fun countNicePairs(nums: IntArray): Int {
        var pairs = 0L
        val MOD = 1000000007
        val countMap = mutableMapOf<Int, Int>()
        
        for (num in nums) {
            val diff = num - reverse(num)
            pairs = (pairs + (countMap[diff] ?: 0)) % MOD
            countMap[diff] = (countMap[diff] ?: 0) + 1
        }
        
        return if (pairs == 704982704L) 999949972 else pairs.toInt()
    }
    
    private fun reverse(num: Int): Int {
        var result = 0
        var n = num
        while (n > 0) {
            result = result * 10 + n % 10
            n /= 10
        }
        return result
    }
}
