class Solution {
    fun maxScore(s: String): Int {
        val totalOnes = s.count { it == '1' }
        var zerosCount = 0
        var onesCount = 0
        var bestScore = Int.MIN_VALUE
        
        for (i in 0 until s.length - 1) {
            if (s[i] == '0') {
                zerosCount++
            } else {
                onesCount++
            }
            
            val currentScore = zerosCount + (totalOnes - onesCount)
            bestScore = maxOf(bestScore, currentScore)
        }
        
        return bestScore
    }
}
