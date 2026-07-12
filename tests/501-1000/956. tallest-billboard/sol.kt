class Solution {
    fun tallestBillboard(rods: IntArray): Int {
        val n = rods.size
        val mid = (n - 1) shr 1
        val left = mutableListOf<Pair<Int, Int>>()
        val right = mutableListOf<Pair<Int, Int>>()
        
        fun gen(idx: Int, end: Int, a: Int, b: Int, vals: MutableList<Pair<Int, Int>>) {
            if (idx == end + 1) {
                vals.add(Pair(a - b, b))
                return
            }
            gen(idx + 1, end, a, b, vals)
            gen(idx + 1, end, a + rods[idx], b, vals)
            gen(idx + 1, end, a, b + rods[idx], vals)
        }
        
        gen(0, mid, 0, 0, left)
        gen(mid + 1, n - 1, 0, 0, right)
        
        left.sortWith(compareBy<Pair<Int, Int>> { it.first }.thenByDescending { it.second })
        right.sortWith(compareBy<Pair<Int, Int>> { it.first }.thenByDescending { it.second })
        
        var ans = 0
        val rightDiffs = right.map { it.first }
        val rightHeights = right.map { it.second }
        
        for ((d, b) in left) {
            val target = -d
            var idx = rightDiffs.binarySearch(target)
            if (idx < 0) idx = -idx - 1
            if (idx < rightDiffs.size && rightDiffs[idx] == target) {
                ans = maxOf(ans, b + rightHeights[idx])
            }
        }
        return ans
    }
}
