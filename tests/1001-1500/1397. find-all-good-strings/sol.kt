class Solution {
    private val mod = 1_000_000_007
    private var length = 0
    private lateinit var lower: String
    private lateinit var upper: String
    private lateinit var evil: String
    private lateinit var lps: IntArray
    private lateinit var memo: Array<Array<Array<IntArray>>>

    fun findGoodStrings(n: Int, s1: String, s2: String, evil: String): Int {
        length = n
        lower = s1
        upper = s2
        this.evil = evil
        lps = IntArray(evil.length)
        for (i in 1 until evil.length) {
            var j = lps[i - 1]
            while (j > 0 && evil[i] != evil[j]) j = lps[j - 1]
            if (evil[i] == evil[j]) lps[i] = j + 1
        }
        memo = Array(n) { Array(evil.length) { Array(2) { IntArray(2) { -1 } } } }
        return dp(0, 0, 1, 1)
    }

    private fun dp(index: Int, matched: Int, lowerTight: Int, upperTight: Int): Int {
        if (matched == evil.length) return 0
        if (index == length) return 1
        val cached = memo[index][matched][lowerTight][upperTight]
        if (cached != -1) return cached
        val low = if (lowerTight == 1) lower[index] else 'a'
        val high = if (upperTight == 1) upper[index] else 'z'
        var answer = 0
        for (char in low..high) {
            var next = matched
            while (next > 0 && char != evil[next]) next = lps[next - 1]
            if (char == evil[next]) next++
            answer = ((answer.toLong() + dp(index + 1, next, if (lowerTight == 1 && char == low) 1 else 0, if (upperTight == 1 && char == high) 1 else 0)) % mod).toInt()
        }
        memo[index][matched][lowerTight][upperTight] = answer
        return answer
    }
}
