class Solution {
    fun escapeGhosts(ghosts: Array<IntArray>, target: IntArray): Boolean {
        val a = IntArray(ghosts.size)
        for (i in ghosts.indices) {
            a[i] = Math.abs(ghosts[i][0] - target[0]) + Math.abs(ghosts[i][1] - target[1])
        }
        
        val z = Math.abs(target[0] - 0) + Math.abs(target[1] - 0)
        
        var ans = true
        for (i in a) {
            if (i <= z) {
                ans = false
            }
        }
        
        return ans
    }
}
