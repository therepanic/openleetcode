class Solution {
    fun concatenatedBinary(n: Int): Int {
        val MOD = 1_000_000_007
        var res = 0L
        var bits = 0

        for (i in 1..n) {
            if ((i and (i - 1)) == 0) {
                bits++
            }
            res = ((res shl bits) or i.toLong()) % MOD
        }

        return res.toInt()
    }
}
