class Solution {
    fun climbStairs(n: Int): Int {
        if (n <= 3) {
            return n
        }
        var prev2 = 2
        var prev1 = 3
        for (step in 4..n) {
            val cur = prev1 + prev2
            prev2 = prev1
            prev1 = cur
        }
        return prev1
    }
}
