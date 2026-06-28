class Solution {
    fun shortestCompletingWord(licensePlate: String, words: Array<String>): String {
        val lp = IntArray(26)
        for (c in licensePlate.lowercase()) {
            if (c.isLetter()) {
                lp[c - 'a']++
            }
        }
        var ans: String? = null
        for (w in words) {
            val cw = IntArray(26)
            for (c in w) {
                cw[c - 'a']++
            }
            var ok = true
            for (i in 0 until 26) {
                if (cw[i] < lp[i]) {
                    ok = false
                    break
                }
            }
            if (ok && (ans == null || w.length < ans.length)) {
                ans = w
            }
        }
        return ans!!
    }
}
