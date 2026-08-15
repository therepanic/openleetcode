class Solution {
    fun minNonZeroProduct(p: Int): Int {
        val mod = 1_000_000_007L
        val maxNum = (1L shl p) - 1
        val count = (1L shl (p - 1)) - 1
        
        fun powMod(x: Long, n: Long): Long {
            var base = x % mod
            var exp = n
            var res = 1L
            while (exp > 0) {
                if ((exp and 1L) == 1L) {
                    res = (res * base) % mod
                }
                base = (base * base) % mod
                exp = exp shr 1
            }
            return res
        }
        
        val pow = powMod(maxNum - 1, count)
        return ((pow * (maxNum % mod)) % mod).toInt()
    }
}
