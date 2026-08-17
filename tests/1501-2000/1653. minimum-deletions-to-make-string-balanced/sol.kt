class Solution {
    fun minimumDeletions(s: String): Int {
        var res = 0
        var count = 0
        for (ch in s) {
            if (ch == 'b') {
                count++
            } else if (count > 0) {
                res++
                count--
            }
        }
        return res
    }
}
