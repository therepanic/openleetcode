class Solution {
    fun hIndex(citations: IntArray): Int {
        citations.sortDescending()
        var count = 0
        for (i in citations.indices) {
            if (citations[i] >= i + 1) {
                count = i + 1
            } else {
                break
            }
        }
        return count
    }
}
