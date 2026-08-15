class Solution {
    fun minimumOneBitOperations(n: Int): Int {
        var highest = 0
        for (i in 0 until 32) {
            if ((n and (1 shl i)) != 0) {
                highest = i
            }
        }

        var ans = 0
        var add = true
        for (i in highest downTo 0) {
            if ((n and (1 shl i)) != 0) {
                val value = (1 shl (i + 1)) - 1
                if (add) {
                    ans += value
                } else {
                    ans -= value
                }
                add = !add
            }
        }

        return ans
    }
}
