class Solution {
    fun findRelativeRanks(score: IntArray): Array<String> {
        val n = score.size
        val sorted = score.sortedDescending()
        val ranks = mutableMapOf<Int, String>()
        for (i in sorted.indices) {
            ranks[sorted[i]] = (i + 1).toString()
        }
        ranks[sorted[0]] = "Gold Medal"
        if (n > 1) ranks[sorted[1]] = "Silver Medal"
        if (n > 2) ranks[sorted[2]] = "Bronze Medal"
        return Array(n) { ranks[score[it]]!! }
    }
}
