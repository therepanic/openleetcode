class Solution {
    fun maxBuilding(n: Int, restrictions: Array<IntArray>): Int {
        val r = restrictions.toMutableList()
        r.add(intArrayOf(1, 0))
        r.sortBy { it[0] }
        val m = r.size
        
        for (i in 1 until m) {
            r[i][1] = minOf(r[i][1], r[i-1][1] + Math.abs(r[i][0] - r[i-1][0]))
        }
        
        for (i in m - 2 downTo 0) {
            r[i][1] = minOf(r[i][1], r[i+1][1] + Math.abs(r[i+1][0] - r[i][0]))
        }
        
        var res = 0
        for (i in 1 until m) {
            res = maxOf(res, (r[i-1][1] + r[i][1] + r[i][0] - r[i-1][0]) / 2)
        }
        
        return maxOf(res, r[m-1][1] + n - r[m-1][0])
    }
}
