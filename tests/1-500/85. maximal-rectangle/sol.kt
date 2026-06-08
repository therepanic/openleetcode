import java.util.ArrayDeque

class Solution {
    fun maximalRectangle(matrix: Array<CharArray>): Int {
        if (matrix.isEmpty() || matrix[0].isEmpty()) return 0

        val cols = matrix[0].size
        val heights = IntArray(cols)
        var answer = 0

        for (row in matrix) {
            for (c in 0 until cols) {
                heights[c] = if (row[c] == '1') heights[c] + 1 else 0
            }
            answer = maxOf(answer, largest(heights))
        }

        return answer
    }

    private fun largest(heights: IntArray): Int {
        val stack = ArrayDeque<Int>()
        var best = 0

        for (i in 0..heights.size) {
            val current = if (i == heights.size) 0 else heights[i]
            while (stack.isNotEmpty() && heights[stack.peek()] > current) {
                val height = heights[stack.pop()]
                val left = if (stack.isEmpty()) -1 else stack.peek()
                best = maxOf(best, height * (i - left - 1))
            }
            stack.push(i)
        }

        return best
    }
}
