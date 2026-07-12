class Solution {
    fun nthMagicalNumber(n: Int, a: Int, b: Int): Int {
        val MOD = 1000000007
        val g = gcd(a, b)
        val lcm = a.toLong() / g * b
        var lo = minOf(a, b).toLong()
        var hi = n.toLong() * lo
        while (lo < hi) {
            val mid = (lo + hi) shr 1
            val cnt = mid / a + mid / b - mid / lcm
            if (cnt < n) {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return (lo % MOD).toInt()
    }
    
    private fun gcd(x: Int, y: Int): Int {
        var a = x
        var b = y
        while (b != 0) {
            val t = b
            b = a % b
            a = t
        }
        return a
    }
}
