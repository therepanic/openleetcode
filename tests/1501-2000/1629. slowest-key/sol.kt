class Solution {
    fun slowestKey(releaseTimes: IntArray, keysPressed: String): Char {
        var maxTime = releaseTimes[0]
        var ans = keysPressed[0]
        for (i in 1 until releaseTimes.size) {
            val currTime = releaseTimes[i] - releaseTimes[i-1]
            if (currTime > maxTime) {
                maxTime = currTime
                ans = keysPressed[i]
            } else if (currTime == maxTime) {
                ans = maxOf(ans, keysPressed[i])
            }
        }
        return ans
    }
}
