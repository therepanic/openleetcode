class Solution {
    fun xorOperation(n: Int, start: Int): Int {
        var ans = 0
        var currentStart = start
        var remaining = n
        while (remaining > 0) {
            ans = ans xor currentStart
            currentStart += 2
            remaining--
        }
        return ans
    }
}
