class Solution {
    fun isOneBitCharacter(bits: IntArray): Boolean {
        var i = 0
        val n = bits.size
        while (i < n - 1) {
            i += 1 + if (bits[i] == 1) 1 else 0
        }
        return i == n - 1
    }
}
