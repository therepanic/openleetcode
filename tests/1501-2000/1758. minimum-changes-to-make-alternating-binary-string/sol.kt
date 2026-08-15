class Solution {
    fun minOperations(s: String): Int {
        var c = 0
        var j = 0
        val n = s.length
        for (ch in s) {
            if (ch - '0' == j) {
                c++
            }
            j = j xor 1
        }
        return minOf(c, n - c)
    }
}
