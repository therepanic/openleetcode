class Solution {
    fun getSmallestString(n: Int, k: Int): String {
        val res = CharArray(n) { 'a' }
        var kk = k - n

        var i = n - 1
        while (kk > 0) {
            val add = minOf(25, kk)
            res[i] = ('a'.code + add).toChar()
            kk -= add
            i--
        }

        return String(res)
    }
}
