class Solution {
    fun maxStudents(seats: Array<CharArray>): Int {
        val m = seats.size
        val n = seats[0].size
        val available = IntArray(m)
        for (i in 0 until m) {
            var mask = 0
            for (j in 0 until n) {
                if (seats[i][j] == '.') {
                    mask = mask or (1 shl j)
                }
            }
            available[i] = mask
        }

        val validMasks = (0 until (1 shl n)).filter { it and (it shl 1) == 0 }
        var dp = mapOf(0 to 0)
        for (row in 0 until m) {
            val nextDp = mutableMapOf<Int, Int>()
            for (current in validMasks) {
                if (current and available[row].inv() != 0) continue
                val count = current.countOneBits()
                for ((previous, total) in dp) {
                    if (current and ((previous shl 1) or (previous shr 1)) != 0) continue
                    nextDp[current] = maxOf(nextDp.getOrDefault(current, 0), total + count)
                }
            }
            dp = nextDp
        }

        return dp.values.maxOrNull() ?: 0
    }
}
