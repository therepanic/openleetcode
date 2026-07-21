class Solution {
    fun nthUglyNumber(n: Int, a: Int, b: Int, c: Int): Int {
        fun gcd(x: Long, y: Long): Long {
            var xx = x
            var yy = y
            while (yy != 0L) {
                val temp = yy
                yy = xx % yy
                xx = temp
            }
            return xx
        }
        
        fun lcm(x: Long, y: Long): Long {
            return x * y / gcd(x, y)
        }
        
        val la = a.toLong()
        val lb = b.toLong()
        val lc = c.toLong()
        
        val ab = lcm(la, lb)
        val ac = lcm(la, lc)
        val bc = lcm(lb, lc)
        val abc = lcm(ab, lc)
        
        var left = 1L
        var right = 2_000_000_000L
        
        while (left < right) {
            val mid = left + (right - left) / 2
            val cnt = mid / la + mid / lb + mid / lc -
                      mid / ab - mid / ac - mid / bc +
                      mid / abc
            if (cnt >= n) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left.toInt()
    }
}
