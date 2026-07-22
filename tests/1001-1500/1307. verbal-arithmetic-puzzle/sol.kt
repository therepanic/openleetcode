class Solution {
    fun isSolvable(words: Array<String>, result: String): Boolean {
        val zeroes = mutableSetOf<Char>()
        var m = 0
        for (word in words) {
            if (word.length > 1) {
                zeroes.add(word[0])
            }
            m = maxOf(m, word.length)
        }
        if (m > result.length) return false
        
        val d = mutableMapOf<Char, Int>()
        for (word in words + result) {
            for (c in word) {
                d[c] = -1
            }
        }
        val wordsRev = words.map { it.reversed() }
        val resultRev = result.reversed()
        val R = resultRev.length
        val N = wordsRev.size
        val visited = (0..9).toMutableSet()
        
        fun rec(wi: Int, ri: Int, rem: Int): Boolean {
            if (ri == R) {
                return rem == 0 && (result.length == 1 || d[resultRev[R-1]] != 0)
            }
            if (wi == N) {
                if (d[resultRev[ri]] != -1) {
                    if (d[resultRev[ri]] != rem % 10) return false
                    else return rec(0, ri+1, rem/10)
                } else if (rem % 10 in visited) {
                    val v = rem % 10
                    visited.remove(v)
                    d[resultRev[ri]] = v
                    val ret = rec(wi, ri, rem)
                    d[resultRev[ri]] = -1
                    visited.add(v)
                    if (ret) return true
                }
                return false
            }
            if (wordsRev[wi].length <= ri) {
                return rec(wi+1, ri, rem)
            }
            if (d[wordsRev[wi][ri]] != -1) {
                return rec(wi+1, ri, rem + d[wordsRev[wi][ri]]!!)
            }
            for (v in 0..9) {
                if (v in visited && (v != 0 || wordsRev[wi][ri] !in zeroes)) {
                    visited.remove(v)
                    d[wordsRev[wi][ri]] = v
                    val ret = rec(wi+1, ri, rem + v)
                    d[wordsRev[wi][ri]] = -1
                    visited.add(v)
                    if (ret) return true
                }
            }
            return false
        }
        
        return rec(0, 0, 0)
    }
}
