class Solution {
    fun numSub(s: String): Int {
        var cnt = 0
        var total = 0
        val mod = 1000000007
        for (a in s) {
            if (a == '1') {
                cnt++
            } else {
                cnt = 0
            }
            total = (total + cnt) % mod
        }
        return total
    }
}
