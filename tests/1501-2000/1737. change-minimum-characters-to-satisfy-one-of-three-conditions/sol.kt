class Solution {
    fun minCharacters(a: String, b: String): Int {
        val freqA = IntArray(26)
        val freqB = IntArray(26)

        for (ch in a) freqA[ch - 'a']++
        for (ch in b) freqB[ch - 'a']++

        val lenA = a.length
        val lenB = b.length
        var res = Int.MAX_VALUE
        var sumA = 0
        var sumB = 0

        for (i in 0 until 25) {
            sumA += freqA[i]
            sumB += freqB[i]
            res = minOf(res, lenA - sumA + sumB)
            res = minOf(res, lenB - sumB + sumA)
        }

        for (i in 0 until 26) {
            res = minOf(res, (lenA - freqA[i]) + (lenB - freqB[i]))
        }

        return res
    }
}
