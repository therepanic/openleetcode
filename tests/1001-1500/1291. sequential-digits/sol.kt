class Solution {
    fun sequentialDigits(low: Int, high: Int): List<Int> {
        val q = mutableListOf<Int>()
        for (i in 1..9) {
            q.add(i)
        }
        var i = 0
        while (i < q.size) {
            val x = q[i]
            val d = x % 10
            if (d < 9) {
                q.add(x * 10 + d + 1)
            }
            i++
        }
        return q.filter { low <= it && it <= high }
    }
}
