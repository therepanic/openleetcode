class Solution {
    fun myPow(x: Double, n: Int): Double {
        var base = x
        var exp = n.toLong()
        if (exp < 0) {
            base = 1.0 / base
            exp = -exp
        }

        var ans = 1.0
        while (exp > 0) {
            if ((exp and 1L) == 1L) {
                ans *= base
            }
            base *= base
            exp = exp shr 1
        }
        return ans
    }
}
