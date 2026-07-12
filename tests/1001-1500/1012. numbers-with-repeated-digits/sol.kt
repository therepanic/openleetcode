class Solution {
    fun numDupDigitsAtMostN(n: Int): Int {
        val digits = (n + 1).toString().map { it - '0' }.toIntArray()
        val nl = digits.size
        var res = 0
        for (i in 0 until nl - 1) {
            res += 9 * perm(9, i)
        }
        val used = BooleanArray(10)
        for (i in 0 until nl) {
            val x = digits[i]
            val start = if (i == 0) 1 else 0
            for (y in start until x) {
                if (!used[y]) {
                    res += perm(9 - i, nl - i - 1)
                }
            }
            if (used[x]) break
            used[x] = true
        }
        return n - res
    }
    
    private fun perm(n: Int, k: Int): Int {
        if (k < 0 || k > n) return 0
        var ans = 1
        for (i in 0 until k) {
            ans *= (n - i)
        }
        return ans
    }
}
