class Solution {
    fun distributeCandies(candyType: IntArray): Int {
        val n = candyType.size
        val k = n / 2
        val set = candyType.toSet()
        return minOf(k, set.size)
    }
}
