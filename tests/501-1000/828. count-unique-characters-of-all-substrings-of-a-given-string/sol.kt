class Solution {
    fun uniqueLetterString(s: String): Int {
        val n = s.length
        val left = IntArray(n)
        val right = IntArray(n)
        val prev = IntArray(26) { -1 }

        for (i in 0 until n) {
            val idx = s[i] - 'A'
            left[i] = prev[idx]
            prev[idx] = i
        }

        for (i in 0 until 26) prev[i] = n

        for (i in n - 1 downTo 0) {
            val idx = s[i] - 'A'
            right[i] = prev[idx]
            prev[idx] = i
        }

        var ans = 0
        for (i in 0 until n) {
            ans += (i - left[i]) * (right[i] - i)
        }
        return ans
    }
}
