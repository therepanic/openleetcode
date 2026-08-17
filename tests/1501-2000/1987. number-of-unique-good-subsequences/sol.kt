class Solution {
    fun numberOfUniqueGoodSubsequences(binary: String): Int {
        var a = 0L
        var b = 0L
        var z = 0
        for (c in binary) {
            if (c == '1') {
                b = (a + b + 1) % 1000000007L
            } else {
                a = (a + b) % 1000000007L
                z = 1
            }
        }
        return ((a + b + z) % 1000000007L).toInt()
    }
}
