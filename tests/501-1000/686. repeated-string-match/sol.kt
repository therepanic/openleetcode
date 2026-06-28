class Solution {
    fun repeatedStringMatch(a: String, b: String): Int {
        var repeatA = a
        var count = 1

        while (repeatA.length < b.length) {
            repeatA += a
            count++
            if (b in repeatA) {
                return count
            }
        }

        repeatA += a
        count++
        if (b in repeatA) {
            return count
        }

        return -1
    }
}
