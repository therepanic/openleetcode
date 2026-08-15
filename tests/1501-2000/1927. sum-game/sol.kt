class Solution {
    fun sumGame(num: String): Boolean {
        val n = num.length
        val half = n / 2
        var sumLeft = 0
        var sumRight = 0
        var qLeft = 0
        var qRight = 0

        for (i in 0 until half) {
            val c = num[i]
            if (c == '?') qLeft++
            else sumLeft += c - '0'
        }

        for (i in half until n) {
            val c = num[i]
            if (c == '?') qRight++
            else sumRight += c - '0'
        }

        return (sumLeft - sumRight) * 2 != (qRight - qLeft) * 9
    }
}
