class Solution {
    fun tribonacci(n: Int): Int {
        var ft = 0
        var st = 1
        var tt = 1
        for (i in 1..n) {
            val frt = ft + st + tt
            ft = st
            st = tt
            tt = frt
        }
        return ft
    }
}
