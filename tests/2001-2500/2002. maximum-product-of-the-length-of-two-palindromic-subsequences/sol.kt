class Solution {
    fun maxProduct(s: String): Int {
        val n = s.length
        val palinMasks = mutableListOf<Pair<Int, Int>>()
        
        for (mask in 1 until (1 shl n)) {
            val sb = StringBuilder()
            for (i in 0 until n) {
                if (((mask shr i) and 1) == 1) {
                    sb.append(s[i])
                }
            }
            val seq = sb.toString()
            if (seq == sb.reverse().toString()) {
                palinMasks.add(Pair(mask, Integer.bitCount(mask)))
            }
        }
        
        var maxProduct = 0
        for (i in palinMasks.indices) {
            for (j in i + 1 until palinMasks.size) {
                val (m1, l1) = palinMasks[i]
                val (m2, l2) = palinMasks[j]
                if ((m1 and m2) == 0) {
                    maxProduct = maxOf(maxProduct, l1 * l2)
                }
            }
        }
        
        return maxProduct
    }
}
