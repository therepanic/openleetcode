class Solution {
    fun reverse(x: Int): Int {
        var value = x
        var res = 0L

        while (value != 0) {
            res = res * 10 + value % 10
            value /= 10
            if (res < Int.MIN_VALUE || res > Int.MAX_VALUE) {
                return 0
            }
        }

        return res.toInt()
    }
}
