class Solution {
    fun removeBoxes(boxes: IntArray): Int {
        val groups = mutableListOf<IntArray>()
        var i = 0
        while (i < boxes.size) {
            val color = boxes[i]
            var count = 0
            while (i < boxes.size && boxes[i] == color) {
                count++
                i++
            }
            groups.add(intArrayOf(color, count))
        }
        
        val n = groups.size
        val dp = Array(n) { Array(n) { IntArray(boxes.size + 1) } }
        return dfs(groups, 0, n - 1, 0, dp)
    }
    
    private fun dfs(groups: List<IntArray>, l: Int, r: Int, k: Int, dp: Array<Array<IntArray>>): Int {
        if (l > r) return 0
        if (dp[l][r][k] != 0) return dp[l][r][k]
        
        val color = groups[l][0]
        val count = groups[l][1] + k
        var res = count * count + dfs(groups, l + 1, r, 0, dp)
        
        for (i in l + 1..r) {
            if (groups[i][0] == color) {
                val left = dfs(groups, l + 1, i - 1, 0, dp)
                val right = dfs(groups, i, r, count, dp)
                res = maxOf(res, left + right)
            }
        }
        
        dp[l][r][k] = res
        return res
    }
}
