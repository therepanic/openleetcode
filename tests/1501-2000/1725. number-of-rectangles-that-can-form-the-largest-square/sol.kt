class Solution {
    fun countGoodRectangles(rectangles: Array<IntArray>): Int {
        val maxLen = rectangles.maxOf { it.min() }
        return rectangles.count { it.min() == maxLen }
    }
}
