class Solution {
    private val memo = mutableMapOf<Long, Int>()
    
    fun leastOpsExpressTarget(x: Int, target: Int): Int {
        return dfs(target.toLong(), x.toLong())
    }
    
    private fun dfs(`val`: Long, x: Long): Int {
        memo[`val`]?.let { return it }
        if (`val` < x) {
            val res = minOf(2 * `val`.toInt() - 1, 2 * (x - `val`).toInt())
            memo[`val`] = res
            return res
        }
        
        val k = (Math.log(`val`.toDouble()) / Math.log(x.toDouble())).toLong()
        var pow = 1L
        for (i in 0 until k) pow *= x
        
        var ans = k.toInt() + dfs(`val` - pow, x)
        
        val nextPow = pow * x
        if (nextPow < 2 * `val`) {
            ans = minOf(ans, k.toInt() + 1 + dfs(nextPow - `val`, x))
        }
        
        memo[`val`] = ans
        return ans
    }
}
