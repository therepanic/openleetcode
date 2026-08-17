class Solution {
    fun maximumScore(a: Int, b: Int, c: Int): Int {
        val sum = a + b + c
        return minOf(sum - maxOf(a, b, c), sum / 2)
    }
}
