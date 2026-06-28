class Solution {
    fun dailyTemperatures(temperatures: IntArray): IntArray {
        val n = temperatures.size
        val ans = IntArray(n)
        val stack = IntArray(n)
        var top = -1

        for (i in 0 until n) {
            while (top >= 0 && temperatures[i] > temperatures[stack[top]]) {
                val prev = stack[top--]
                ans[prev] = i - prev
            }
            stack[++top] = i
        }

        return ans
    }
}
