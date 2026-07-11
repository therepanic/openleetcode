class Solution {
    fun isValid(s: String): Boolean {
        if (s == "abc") {
            return true
        }
        if (s[0] != 'a' || s[s.length - 1] != 'c') {
            return false
        }
        val l = s.toMutableList()
        for (j in l.indices) {
            var i = 0
            while (i <= l.size - 3) {
                if (l == mutableListOf('a', 'b', 'c')) {
                    return true
                }
                if (i + 2 <= l.size - 1) {
                    if (l[i] == 'a' && l[i+1] == 'b' && l[i+2] == 'c') {
                        repeat(3) { l.removeAt(i) }
                        i = 0
                    } else {
                        i++
                    }
                } else {
                    i++
                }
            }
        }
        if (l.size == 0) {
            return true
        }
        return false
    }
}
