class Solution {
    fun countDifferentSubsequenceGCDs(nums: IntArray): Int {
        val seen = nums.toHashSet()
        val maxi = nums.max() ?: 0
        var cnt = 0
        for (i in 1..maxi) {
            var gd = 0
            var j = i
            while (j <= maxi) {
                if (j in seen) {
                    gd = gcd(gd, j)
                }
                j += i
            }
            if (gd == i) cnt++
        }
        return cnt
    }
    
    private fun gcd(a: Int, b: Int): Int {
        var x = a
        var y = b
        while (y != 0) {
            val temp = x % y
            x = y
            y = temp
        }
        return x
    }
}
