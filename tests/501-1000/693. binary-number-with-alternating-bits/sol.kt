class Solution {
    fun hasAlternatingBits(n: Int): Boolean {
        val x = n xor (n shr 1)
        return (x and (x + 1)) == 0
    }
}
