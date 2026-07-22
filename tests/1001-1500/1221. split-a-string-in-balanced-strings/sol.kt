class Solution {
    fun balancedStringSplit(s: String): Int {
        var bal = 0
        var count = 0
        for (c in s) {
            if (c == 'L') {
                bal++
            } else if (c == 'R') {
                bal--
            }
            if (bal == 0) {
                count++
            }
        }
        return count
    }
}
