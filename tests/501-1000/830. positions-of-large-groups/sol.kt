class Solution {
    fun largeGroupPositions(s: String): List<List<Int>> {
        val intervals = mutableListOf<List<Int>>()
        var left = 0
        while (left < s.length) {
            val start = left
            while (left + 1 < s.length && s[left + 1] == s[left]) {
                left++
            }
            if (left - start >= 2) {
                intervals.add(listOf(start, left))
            }
            left++
        }
        return intervals
    }
}
