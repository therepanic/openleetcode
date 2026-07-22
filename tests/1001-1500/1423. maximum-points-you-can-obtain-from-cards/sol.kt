class Solution {
    fun maxScore(cardPoints: IntArray, k: Int): Int {
        var l = 0
        val n = cardPoints.size
        var total = (n - k until n).sumOf { cardPoints[it] }
        var res = total
        for (r in n - k until n) {
            total += cardPoints[l] - cardPoints[r]
            res = maxOf(res, total)
            l++
        }
        return res
    }
}
