class Solution {
    fun longestDecomposition(text: String): Int {
        var i = 0
        var j = text.length - 1
        var n = 0
        var count = 0
        while (i <= j) {
            if (text[i] == text[j]) {
                if (text.substring(i, i + n + 1) == text.substring(j, j + n + 1)) {
                    count += 2
                    i += n + 1
                    j -= 1
                    n = 0
                    continue
                }
            }
            j -= 1
            n += 1
        }
        return if (i == j + 1) count else count - 1
    }
}
