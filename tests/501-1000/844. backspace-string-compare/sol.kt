class Solution {
    fun backspaceCompare(s: String, t: String): Boolean {
        var ps = s.length - 1
        var pt = t.length - 1

        while (ps >= 0 || pt >= 0) {
            ps = getNextValidCharIndex(s, ps)
            pt = getNextValidCharIndex(t, pt)

            if (ps < 0 && pt < 0) {
                return true
            }
            if (ps < 0 || pt < 0) {
                return false
            } else if (s[ps] != t[pt]) {
                return false
            }

            ps--
            pt--
        }

        return true
    }

    private fun getNextValidCharIndex(s: String, end: Int): Int {
        var backspaceCount = 0
        var current = end
        while (current >= 0) {
            if (s[current] == '#') {
                backspaceCount++
            } else if (backspaceCount > 0) {
                backspaceCount--
            } else {
                break
            }
            current--
        }
        return current
    }
}
