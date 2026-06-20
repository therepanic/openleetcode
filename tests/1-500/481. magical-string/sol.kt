class Solution {
    fun magicalString(n: Int): Int {
        if (n <= 0) return 0
        if (n <= 3) return 1
        val s = mutableListOf(1, 2, 2)
        var i = 2
        while (s.size < n) {
            val nextVal = 3 - s.last()
            val count = s[i]
            repeat(count) {
                if (s.size < n) s.add(nextVal)
            }
            i++
        }
        return s.take(n).count { it == 1 }
    }
}
