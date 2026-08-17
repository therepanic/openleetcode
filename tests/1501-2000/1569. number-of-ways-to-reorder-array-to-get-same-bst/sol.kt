class Solution {
    fun numOfWays(nums: IntArray): Int {
        val MOD = 1000000007
        val n = nums.size
        
        val nCr = Array(n+1) { LongArray(n+1) }
        for (i in 0..n) {
            nCr[i][0] = 1
            nCr[i][i] = 1
            for (j in 1 until i) {
                nCr[i][j] = (nCr[i-1][j-1] + nCr[i-1][j]) % MOD
            }
        }
        
        fun dfs(arr: IntArray): Long {
            if (arr.size <= 2) return 1
            val root = arr[0]
            val left = arr.filter { it < root }.toIntArray()
            val right = arr.filter { it > root }.toIntArray()
            val leftWays = dfs(left)
            val rightWays = dfs(right)
            val L = left.size
            val R = right.size
            return (nCr[L+R][L] * leftWays % MOD * rightWays) % MOD
        }
        
        return ((dfs(nums) - 1) % MOD).toInt()
    }
}
