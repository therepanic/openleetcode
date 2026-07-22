class Solution {
    fun circularPermutation(n: Int, start: Int): List<Int> {
        return (0 until (1 shl n)).map { i -> start xor (i xor (i shr 1)) }
    }
}
