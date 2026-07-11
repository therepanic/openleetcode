class Solution {
    fun superEggDrop(k: Int, n: Int): Int {
        val memo = Array(k + 1) { IntArray(n + 1) { -1 } }
        
        fun solve(eggs: Int, floors: Int): Int {
            if (floors <= 1 || eggs == 1) return floors
            if (memo[eggs][floors] != -1) return memo[eggs][floors]
            
            var low = 1
            var high = floors
            var ans = floors
            
            while (low <= high) {
                val mid = (low + high) / 2
                val breakCase = solve(eggs - 1, mid - 1)
                val notBreakCase = solve(eggs, floors - mid)
                
                ans = minOf(ans, 1 + maxOf(breakCase, notBreakCase))
                if (breakCase < notBreakCase) {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
            
            memo[eggs][floors] = ans
            return ans
        }
        
        return solve(k, n)
    }
}
