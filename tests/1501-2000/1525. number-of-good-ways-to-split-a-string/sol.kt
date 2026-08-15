class Solution {
    fun numSplits(s: String): Int {
        val n = s.length
        var counter = 0
        val distinct_left = mutableMapOf<Char, Int>()
        val distinct_right = mutableMapOf<Char, Int>()

        for (c in s) {
            distinct_right[c] = (distinct_right[c] ?: 0) + 1
        }
        for (i in 0 until n - 1) {
            val c = s[i]
            distinct_left[c] = (distinct_left[c] ?: 0) + 1
            distinct_right[c] = (distinct_right[c] ?: 0) - 1
            if (distinct_right[c] == 0) {
                distinct_right.remove(c)
            }
            if (distinct_left.size == distinct_right.size) {
                counter++
            }
        }

        return counter
    }
}
