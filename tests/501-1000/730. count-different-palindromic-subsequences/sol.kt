class Solution {
    private val MOD = 1000000007
    private lateinit var s: String
    private lateinit var memo: Array<IntArray>
    
    fun countPalindromicSubsequences(s: String): Int {
        this.s = s
        val n = s.length
        memo = Array(n + 1) { IntArray(n + 1) { -1 } }
        return dp(0, n)
    }
    
    private fun dp(left: Int, right: Int): Int {
        if (left >= right) return 0
        if (memo[left][right] != -1) return memo[left][right]
        var res: Long = 0
        for (ch in "abcd") {
            val l = s.indexOf(ch, left)
            if (l == -1 || l >= right) continue
            val r = s.lastIndexOf(ch, right - 1)
            if (r == -1 || r < left) continue
            if (l == r) {
                res += 1
            } else {
                res += dp(l + 1, r) + 2
            }
        }
        res %= MOD
        memo[left][right] = res.toInt()
        return res.toInt()
    }
}
