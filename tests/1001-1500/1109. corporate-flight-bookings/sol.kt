class Solution {
    fun corpFlightBookings(bookings: Array<IntArray>, n: Int): IntArray {
        val l = IntArray(n + 1)
        for (i in bookings) {
            val x = i[0]
            val y = i[1]
            l[x - 1] += i[2]
            l[y] -= i[2]
        }
        
        val s = IntArray(n)
        for (i in 0 until n) {
            if (i == 0) {
                s[i] = l[i]
            } else {
                s[i] = s[i - 1] + l[i]
            }
        }
        return s
    }
}
