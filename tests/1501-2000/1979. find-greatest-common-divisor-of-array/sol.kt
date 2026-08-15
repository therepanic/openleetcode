class Solution {
    fun findGCD(nums: IntArray): Int {
        val a = nums.min()
        val b = nums.max()
        return gcd(a, b)
    }
    
    private fun gcd(a: Int, b: Int): Int {
        var x = a
        var y = b
        while (y != 0) {
            val temp = y
            y = x % y
            x = temp
        }
        return x
    }
}
