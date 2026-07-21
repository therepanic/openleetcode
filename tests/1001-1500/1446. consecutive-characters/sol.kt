class Solution {
    fun maxPower(s: String): Int {
        var maxcnt = 0
        var cnt = 0
        for (i in 1 until s.length) {
            if (s[i] == s[i - 1]) {
                cnt++
            } else {
                cnt = 0
            }
            maxcnt = maxOf(cnt, maxcnt)
        }
        return maxcnt + 1
    }
}
