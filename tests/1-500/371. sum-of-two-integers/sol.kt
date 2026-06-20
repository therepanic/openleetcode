class Solution {
    fun getSum(a: Int, b: Int): Int {
        var a = a
        var b = b
        while (b != 0) {
            val c = (a and b) shl 1
            a = a xor b
            b = c
        }
        return a
    }
}
