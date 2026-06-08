class Solution {
    fun grayCode(n: Int): List<Int> {
        val total = 1 shl n
        val result = ArrayList<Int>(total)
        for (i in 0 until total) {
            result.add(i xor (i shr 1))
        }
        return result
    }
}
