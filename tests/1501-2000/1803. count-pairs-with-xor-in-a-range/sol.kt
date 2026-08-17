class Solution {
    fun countPairs(nums: IntArray, low: Int, high: Int): Int {
        val maxVal = nums.maxOrNull() ?: 0
        val bits = maxOf(1, maxOf(Integer.toBinaryString(maxVal).length, Integer.toBinaryString(high + 1).length))

        fun countLess(bound: Int): Int {
            if (bound <= 0) return 0
            val child = mutableListOf(mutableListOf(-1, -1))
            val counts = mutableListOf(0)
            var total = 0
            for (value in nums) {
                var node = 0
                for (bit in bits - 1 downTo 0) {
                    val v = (value shr bit) and 1
                    val b = (bound shr bit) and 1
                    if (b == 1) {
                        val same = child[node][v]
                        if (same != -1) total += counts[same]
                        val nxt = child[node][1 - v]
                        if (nxt == -1) { node = -1; break }
                        node = nxt
                    } else {
                        val nxt = child[node][v]
                        if (nxt == -1) { node = -1; break }
                        node = nxt
                    }
                }
                node = 0
                for (bit in bits - 1 downTo 0) {
                    val v = (value shr bit) and 1
                    val nxt = child[node][v]
                    if (nxt == -1) {
                        val newIdx = child.size
                        child[node][v] = newIdx
                        child.add(mutableListOf(-1, -1))
                        counts.add(0)
                        child[node][v] = newIdx
                    }
                    node = child[node][v]
                    counts[node]++
                }
            }
            return total
        }

        return countLess(high + 1) - countLess(low)
    }
}
