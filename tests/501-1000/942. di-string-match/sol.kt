class Solution {
    fun diStringMatch(s: String): IntArray {
        var low = 0
        var high = s.length
        val result = IntArray(s.length + 1)
        for (i in s.indices) {
            if (s[i] == 'I') {
                result[i] = low++
            } else {
                result[i] = high--
            }
        }
        result[s.length] = low
        return result
    }
}
