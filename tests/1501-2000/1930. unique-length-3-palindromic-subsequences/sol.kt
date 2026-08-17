class Solution {
    fun countPalindromicSubsequence(s: String): Int {
        val n = s.length
        val first = IntArray(26) { -1 }
        val last = IntArray(26) { -1 }

        for (i in 0 until n) {
            val c = s[i] - 'a'
            if (first[c] == -1) first[c] = i
            last[c] = i
        }

        var ans = 0
        for (c in 0 until 26) {
            if (first[c] != -1 && last[c] - first[c] > 1) {
                var mask = 0
                for (i in first[c] + 1 until last[c]) {
                    mask = mask or (1 shl (s[i] - 'a'))
                }
                ans += Integer.bitCount(mask)
            }
        }
        return ans
    }
}
