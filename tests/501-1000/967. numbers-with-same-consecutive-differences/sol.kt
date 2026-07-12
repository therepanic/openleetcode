class Solution {
    fun numsSameConsecDiff(n: Int, k: Int): IntArray {
        var res = (1..9).toMutableSet()
        var remaining = n - 1
        
        while (remaining > 0) {
            val next = mutableSetOf<Int>()
            for (num in res) {
                val last = num % 10
                if (last + k < 10) {
                    next.add(num * 10 + last + k)
                }
                if (last - k >= 0) {
                    next.add(num * 10 + last - k)
                }
            }
            res = next
            remaining -= 1
        }
        
        return res.toIntArray()
    }
}
