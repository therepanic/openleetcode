class Solution {
    fun superPow(a: Int, b: IntArray): Int {
        var aMod = a % 1337
        var result = 1
        for (d in b) {
            result = (powMod(result, 10, 1337) * powMod(aMod, d, 1337)) % 1337
        }
        return result
    }
    
    private fun powMod(x: Int, n: Int, mod: Int): Int {
        var base = x % mod
        var exp = n
        var res = 1
        while (exp > 0) {
            if ((exp and 1) == 1) {
                res = (res * base) % mod
            }
            base = (base * base) % mod
            exp = exp shr 1
        }
        return res
    }
}
