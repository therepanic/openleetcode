class Solution {
    private lateinit var mat: Array<IntArray>
    private val dp = HashMap<Long, Int>()
    private var mini = Int.MAX_VALUE
    
    fun minimizeTheDifference(mat: Array<IntArray>, target: Int): Int {
        this.mat = mat
        for (row in mat) row.sort()
        return dfs(mat.size - 1, target)
    }
    
    private fun dfs(i: Int, ans: Int): Int {
        if (i < 0) {
            mini = minOf(mini, Math.abs(ans))
            return Math.abs(ans)
        }
        val key = i.toLong() * 100000 + (ans + 100000)
        dp[key]?.let { return it }
        if (ans < 0 && Math.abs(ans) > mini) return Int.MAX_VALUE / 2
        var take = Int.MAX_VALUE / 2
        for (z in mat[i].indices) {
            if (z > 0 && mat[i][z] == mat[i][z-1]) continue
            take = minOf(take, dfs(i-1, ans - mat[i][z]))
            if (take == 0) break
        }
        dp[key] = take
        return take
    }
}
