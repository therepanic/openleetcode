class Solution {
    fun expressiveWords(s: String, words: Array<String>): Int {
        fun encode(x: String): Pair<CharArray, IntArray> {
            val chars = StringBuilder()
            val cnts = mutableListOf<Int>()
            var prev: Char? = null
            var c = 0
            for (ch in x) {
                if (ch == prev) {
                    c++
                } else {
                    if (prev != null) {
                        chars.append(prev)
                        cnts.add(c)
                    }
                    prev = ch
                    c = 1
                }
            }
            if (prev != null) {
                chars.append(prev)
                cnts.add(c)
            }
            return Pair(chars.toString().toCharArray(), cnts.toIntArray())
        }
        
        val (sChars, sCnts) = encode(s)
        var ans = 0
        for (w in words) {
            val (wChars, wCnts) = encode(w)
            if (!sChars.contentEquals(wChars)) continue
            var ok = true
            for (i in sCnts.indices) {
                val sc = sCnts[i]
                val wc = wCnts[i]
                if (sc < wc || (sc < 3 && sc != wc)) {
                    ok = false
                    break
                }
            }
            if (ok) ans++
        }
        return ans
    }
}
