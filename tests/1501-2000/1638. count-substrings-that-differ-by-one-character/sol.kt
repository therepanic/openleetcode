class Solution {
    fun countSubstrings(s: String, t: String): Int {
        val m = s.length
        val n = t.length
        var result = 0

        for (i in 0 until m) {
            for (j in 0 until n) {
                var diff = 0
                var k = 0
                while (i + k < m && j + k < n) {
                    if (s[i + k] != t[j + k]) {
                        diff++
                    }
                    if (diff > 1) {
                        break
                    }
                    if (diff == 1) {
                        result++
                    }
                    k++
                }
            }
        }

        return result
    }
}
