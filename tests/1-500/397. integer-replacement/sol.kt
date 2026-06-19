class Solution {
    fun integerReplacement(n: Int): Int {
        fun helper(x: Long, c: Int): Int {
            if (x == 1L) return c
            if (x % 2 == 0L) {
                return helper(x shr 1, c + 1)
            } else {
                if (x == 3L || ((x shr 1) and 1L) == 0L) {
                    return helper(x - 1, c + 1)
                } else {
                    return helper(x + 1, c + 1)
                }
            }
        }
        return helper(n.toLong(), 0)
    }
}
