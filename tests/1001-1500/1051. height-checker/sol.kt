class Solution {
    fun heightChecker(heights: IntArray): Int {
        var count = 0
        val s = heights.sorted()
        for (i in heights.indices) {
            if (heights[i] != s[i]) {
                count++
            }
        }
        return count
    }
}
