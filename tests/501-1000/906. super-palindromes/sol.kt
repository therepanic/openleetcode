class Solution {
    fun superpalindromesInRange(left: String, right: String): Int {
        val L = left.toLong()
        val R = right.toLong()
        var count = 0
        for (i in 1..100000) {
            val s = i.toString()
            val rev = s.reversed()
            val val1 = (s + rev).toLong()
            val val2 = (s + rev.substring(1)).toLong()
            val sqval1 = val1 * val1
            val sqval2 = val2 * val2
            if (L <= sqval1 && sqval1 <= R) {
                val ssqval1 = sqval1.toString()
                if (ssqval1 == ssqval1.reversed()) {
                    count++
                }
            }
            if (L <= sqval2 && sqval2 <= R) {
                val ssqval2 = sqval2.toString()
                if (ssqval2 == ssqval2.reversed()) {
                    count++
                }
            }
            if (val2 > R) {
                break
            }
        }
        return count
    }
}
