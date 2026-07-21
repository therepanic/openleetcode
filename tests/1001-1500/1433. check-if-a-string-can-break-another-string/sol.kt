class Solution {
    fun checkIfCanBreak(s1: String, s2: String): Boolean {
        var freq = IntArray(26)
        val n = s1.length

        for (ch in s1) {
            freq[ch - 'a']++
        }

        val temp1 = StringBuilder()

        for (i in 25 downTo 0) {
            while (freq[i] > 0) {
                temp1.append(('a' + i))
                freq[i]--
            }
        }

        freq = IntArray(26)

        for (ch in s2) {
            freq[ch - 'a']++
        }

        val temp2 = StringBuilder()

        for (i in 25 downTo 0) {
            while (freq[i] > 0) {
                temp2.append(('a' + i))
                freq[i]--
            }
        }

        val sorted1 = temp1.toString()
        val sorted2 = temp2.toString()

        var all1 = true
        var all2 = true

        for (i in 0 until n) {
            if (sorted1[i] < sorted2[i]) {
                all1 = false
            }
            if (sorted2[i] < sorted1[i]) {
                all2 = false
            }
        }

        return all1 || all2
    }
}
