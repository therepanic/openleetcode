class Solution {
    fun getLucky(s: String, k: Int): Int {
        var res = ""
        for (c in s) {
            res += (c - 'a' + 1).toString()
        }
        repeat(k) {
            res = res.map { it - '0' }.sum().toString()
        }
        return res.toInt()
    }
}
