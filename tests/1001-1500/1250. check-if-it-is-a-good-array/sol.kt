class Solution {
    fun isGoodArray(nums: IntArray): Boolean {
        var g = nums[0]
        for (i in 1 until nums.size) {
            g = gcd(g, nums[i])
        }
        return g == 1
    }
    
    private fun gcd(a: Int, b: Int): Int {
        var x = a
        var y = b
        while (y != 0) {
            val t = y
            y = x % y
            x = t
        }
        return x
    }
}
