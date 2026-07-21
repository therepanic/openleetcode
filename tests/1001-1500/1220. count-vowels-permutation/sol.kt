class Solution {
    fun countVowelPermutation(n: Int): Int {
        val MOD = 1000000007
        var a = 1L
        var e = 1L
        var i = 1L
        var o = 1L
        var u = 1L
        for (k in 1 until n) {
            val na = (e + i + u) % MOD
            val ne = (a + i) % MOD
            val ni = (e + o) % MOD
            val no = i % MOD
            val nu = (i + o) % MOD
            a = na
            e = ne
            i = ni
            o = no
            u = nu
        }
        return ((a + e + i + o + u) % MOD).toInt()
    }
}
