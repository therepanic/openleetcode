class Solution {
    fun maxLengthBetweenEqualCharacters(s: String): Int {
        val firstPos = IntArray(26) { -1 }
        val lastPos = IntArray(26) { -1 }
        val n = s.length
        for (i in 0 until n) {
            val idx = s[i] - 'a'
            if (firstPos[idx] == -1) firstPos[idx] = i
        }
        for (i in n - 1 downTo 0) {
            val idx = s[i] - 'a'
            if (lastPos[idx] == -1) lastPos[idx] = i
        }
        var maxLen = -1
        for (i in 0 until 26) {
            if (firstPos[i] != -1 && lastPos[i] != -1) {
                maxLen = maxOf(maxLen, lastPos[i] - firstPos[i] - 1)
            }
        }
        return maxLen
    }
}
