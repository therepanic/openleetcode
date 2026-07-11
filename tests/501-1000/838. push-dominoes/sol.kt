class Solution {
    fun pushDominoes(dominoes: String): String {
        val s = "L" + dominoes + "R"
        val res = StringBuilder()
        var prev = 0
        for (curr in 1 until s.length) {
            if (s[curr] == '.') continue
            val span = curr - prev - 1
            if (prev > 0) res.append(s[prev])
            if (s[prev] == s[curr]) {
                repeat(span) { res.append(s[prev]) }
            } else if (s[prev] == 'L' && s[curr] == 'R') {
                repeat(span) { res.append('.') }
            } else {
                repeat(span / 2) { res.append('R') }
                if (span % 2 == 1) res.append('.')
                repeat(span / 2) { res.append('L') }
            }
            prev = curr
        }
        return res.toString()
    }
}
