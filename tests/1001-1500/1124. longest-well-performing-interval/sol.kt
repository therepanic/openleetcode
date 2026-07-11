class Solution {
    fun longestWPI(hours: IntArray): Int {
        var score = 0
        var longestInterval = 0
        val seenAt = mutableMapOf(0 to -1)
        
        for (i in hours.indices) {
            score += if (hours[i] > 8) 1 else -1
            
            if (score > 0) {
                longestInterval = i + 1
            } else if (seenAt.containsKey(score - 1)) {
                longestInterval = maxOf(longestInterval, i - seenAt[score - 1]!!)
            }
            
            if (!seenAt.containsKey(score)) {
                seenAt[score] = i
            }
        }
        
        return longestInterval
    }
}
