class Solution {
    fun lemonadeChange(bills: IntArray): Boolean {
        var f = 0
        var t = 0
        for (bill in bills) {
            if (bill == 5) {
                f++
            } else if (bill == 10) {
                if (f >= 1) {
                    f--
                    t++
                } else {
                    return false
                }
            } else {
                if (f >= 1 && t >= 1) {
                    t--
                    f--
                } else if (f >= 3) {
                    f -= 3
                } else {
                    return false
                }
            }
        }
        return true
    }
}
