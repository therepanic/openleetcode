class Solution {
    fun countBalls(lowLimit: Int, highLimit: Int): Int {
        val boxCount = mutableMapOf<Int, Int>()
        var maxBalls = 0
        for (num in lowLimit..highLimit) {
            val box = num.toString().sumOf { it - '0' }
            boxCount[box] = (boxCount[box] ?: 0) + 1
            maxBalls = maxOf(maxBalls, boxCount[box]!!)
        }
        return maxBalls
    }
}
