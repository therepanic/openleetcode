class Solution {
    fun numDifferentIntegers(word: String): Int {
        var i = 0
        val n = word.length
        val st = mutableSetOf<String>()
        while (i < n) {
            while (i < n && word[i].isLetter()) {
                i++
            }
            var tempInt = StringBuilder()
            while (i < n && word[i].isDigit()) {
                tempInt.append(word[i])
                i++
            }
            var j = 0
            while (j + 1 < tempInt.length && tempInt[j] == '0') {
                j++
            }
            val k = tempInt.substring(j)
            if (k.isNotEmpty()) {
                st.add(k)
            }
        }
        return st.size
    }
}
