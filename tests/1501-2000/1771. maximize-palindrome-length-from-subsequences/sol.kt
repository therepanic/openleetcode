class Solution {
    fun longestPalindrome(word1: String, word2: String): Int {
        val word = word1 + word2
        val n = word.length
        val memo = Array(n) { IntArray(n) { -1 } }
        
        fun fn(lo: Int, hi: Int): Int {
            if (lo >= hi) return if (lo == hi) 1 else 0
            if (memo[lo][hi] != -1) return memo[lo][hi]
            memo[lo][hi] = if (word[lo] == word[hi]) {
                2 + fn(lo+1, hi-1)
            } else {
                maxOf(fn(lo+1, hi), fn(lo, hi-1))
            }
            return memo[lo][hi]
        }
        
        var ans = 0
        for (c in word1.toSet()) {
            val i = word1.indexOf(c)
            val j = word2.lastIndexOf(c)
            if (i != -1 && j != -1) {
                ans = maxOf(ans, fn(i, j + word1.length))
            }
        }
        return ans
    }
}
