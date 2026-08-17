class Solution {
    fun canReach(s: String, minJump: Int, maxJump: Int): Boolean {
        val n = s.length
        if (s[n-1] == '1') return false

        val dp = BooleanArray(n)
        dp[0] = true

        var reachable = 0

        for (i in 1 until n) {
            if (i >= minJump && dp[i - minJump]) {
                reachable++
            }

            if (i > maxJump && dp[i - maxJump - 1]) {
                reachable--
            }

            if (reachable > 0 && s[i] == '0') {
                dp[i] = true
            }
        }

        return dp[n-1]
    }
}
