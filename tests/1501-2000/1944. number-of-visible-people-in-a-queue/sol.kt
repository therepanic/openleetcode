class Solution {
    fun canSeePersonsCount(heights: IntArray): IntArray {
        val n = heights.size
        val result = IntArray(n)
        val stack = mutableListOf<Int>()

        for (i in n-1 downTo 0) {
            val height = heights[i]
            var visibility = 0

            while (stack.isNotEmpty() && height > stack.last()) {
                stack.removeAt(stack.size - 1)
                visibility++
            }

            if (stack.isNotEmpty()) {
                visibility++
            }

            result[i] = visibility
            stack.add(height)
        }

        return result
    }
}
