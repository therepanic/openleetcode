class Solution {
    fun reachNumber(target: Int): Int {
        var t = Math.abs(target)
        val n = ((-1 + Math.sqrt(1.0 + 8.0 * t)) / 2).toInt()
        val a = n * (n + 1) / 2
        val b = a + n + 1
        
        if (a == t)
            return n
        if ((b - t) % 2 == 0)
            return n + 1
        return if ((n + 2) % 2 == 1) n + 2 else n + 3
    }
}
