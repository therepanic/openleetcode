class Solution {
    fun bitwiseComplement(n: Int): Int {
        if (n == 0) {
            return 1
        }
        val bitLength = Integer.toBinaryString(n).length
        val mask = (1 shl bitLength) - 1
        return n xor mask
    }
}
