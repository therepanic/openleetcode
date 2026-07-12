class Solution {
    fun maxScoreSightseeingPair(values: IntArray): Int {
        val n = values.size
        val suffixMax = IntArray(n)
        suffixMax[n - 1] = values[n - 1] - (n - 1)
        
        for (i in n - 2 downTo 0) {
            suffixMax[i] = maxOf(suffixMax[i + 1], values[i] - i)
        }
        
        var maxScore = Int.MIN_VALUE
        for (i in 0 until n - 1) {
            maxScore = maxOf(maxScore, values[i] + i + suffixMax[i + 1])
        }
        
        return maxScore
    }
}
