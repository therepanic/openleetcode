class Solution {
    fun earliestAndLatest(n: Int, firstPlayer: Int, secondPlayer: Int): IntArray {
        return dfs(n, firstPlayer, secondPlayer)
    }
    
    private fun dfs(n: Int, p1: Int, p2: Int): IntArray {
        if (p1 + p2 == n + 1) return intArrayOf(1, 1)
        var p1 = p1
        var p2 = p2
        if (p1 > p2) { val t = p1; p1 = p2; p2 = t }
        if (n <= 4) return intArrayOf(2, 2)
        
        val m = (n + 1) / 2
        var minR = Int.MAX_VALUE
        var maxR = Int.MIN_VALUE
        
        if (p1 - 1 > n - p2) {
            val t = n + 1 - p1
            p1 = n + 1 - p2
            p2 = t
        }
        
        if (p2 * 2 <= n + 1) {
            val a = p1 - 1
            val b = p2 - p1 - 1
            for (i in 0..a) {
                for (j in 0..b) {
                    val r = dfs(m, i + 1, i + j + 2)
                    minR = minOf(minR, r[0] + 1)
                    maxR = maxOf(maxR, r[1] + 1)
                }
            }
        } else {
            val p4 = n + 1 - p2
            val a = p1 - 1
            val b = p4 - p1 - 1
            val c = p2 - p4 - 1
            for (i in 0..a) {
                for (j in 0..b) {
                    val offset = i + j + 1 + (c + 1) / 2 + 1
                    val r = dfs(m, i + 1, offset)
                    minR = minOf(minR, r[0] + 1)
                    maxR = maxOf(maxR, r[1] + 1)
                }
            }
        }
        
        return intArrayOf(minR, maxR)
    }
}
