class Solution {
    fun findLUSlength(a: String, b: String): Int {
        if (a == b) {
            return -1
        } else {
            return maxOf(a.length, b.length)
        }
    }
}
