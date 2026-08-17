class Solution {
    fun minCost(colors: String, neededTime: IntArray): Int {
        var sum = 0
        for (i in 1 until colors.length) {
            if (colors[i] == colors[i - 1]) {
                sum += minOf(neededTime[i], neededTime[i - 1])
                neededTime[i] = maxOf(neededTime[i], neededTime[i - 1])
            }
        }
        return sum
    }
}
