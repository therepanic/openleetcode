class Solution {
    fun maxDepth(s: String): Int {
        var ctr = 0
        var ans = 0
        for (ch in s) {
            if (ch == '(') {
                ctr++
                ans = maxOf(ans, ctr)
            } else if (ch == ')') {
                ctr--
            }
        }
        return ans
    }
}
