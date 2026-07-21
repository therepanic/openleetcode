class Solution {
    fun getNoZeroIntegers(n: Int): IntArray {
        for (i in 1 until n) {
            if (!i.toString().contains('0') && !(n - i).toString().contains('0')) {
                return intArrayOf(i, n - i)
            }
        }
        return intArrayOf()
    }
}
