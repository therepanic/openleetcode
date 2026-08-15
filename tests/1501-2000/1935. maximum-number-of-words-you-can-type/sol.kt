class Solution {
    fun canBeTypedWords(text: String, brokenLetters: String): Int {
        val b = BooleanArray(26)
        var res = 0

        for (c in brokenLetters) {
            b[c - 'a'] = true
        }

        for (w in text.split(" ")) {
            var ok = true
            for (c in w) {
                if (b[c - 'a']) {
                    ok = false
                    break
                }
            }
            if (ok) {
                res++
            }
        }

        return res
    }
}
