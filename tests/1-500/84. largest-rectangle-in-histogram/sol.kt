import java.util.ArrayDeque

class Solution {
    fun largestRectangleArea(heights: IntArray): Int {
        val stack = ArrayDeque<Int>()
        var answer = 0

        for (i in 0..heights.size) {
            val current = if (i == heights.size) 0 else heights[i]
            while (stack.isNotEmpty() && heights[stack.peek()] > current) {
                val height = heights[stack.pop()]
                val left = if (stack.isEmpty()) -1 else stack.peek()
                answer = maxOf(answer, height * (i - left - 1))
            }
            stack.push(i)
        }

        return answer
    }
}
