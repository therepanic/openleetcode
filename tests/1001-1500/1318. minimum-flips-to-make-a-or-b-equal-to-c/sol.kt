class Solution {
    fun minFlips(a: Int, b: Int, c: Int): Int {
        var count = 0
        var aa = a
        var bb = b
        var cc = c
        while (aa != 0 || bb != 0 || cc != 0) {
            val abit = aa and 1
            val bbit = bb and 1
            val cbit = cc and 1

            if (cbit == 0) {
                if (abit == 1) count++
                if (bbit == 1) count++
            } else {
                if (abit == 0 && bbit == 0) count++
            }

            aa = aa shr 1
            bb = bb shr 1
            cc = cc shr 1
        }
        return count
    }
}
