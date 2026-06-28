class Solution {
    fun canPartitionKSubsets(nums: IntArray, k: Int): Boolean {
        val total = nums.sum()
        if (total % k != 0) return false
        val target = total / k
        nums.sortDescending()
        if (nums[0] > target) return false
        val n = nums.size
        val memo = mutableMapOf<Int, Boolean>()
        
        fun dfs(used: Int, curr: Int): Boolean {
            if (used == (1 shl n) - 1) return true
            val key = (used shl 10) or curr
            if (memo.containsKey(key)) return memo[key]!!
            for (i in 0 until n) {
                if ((used shr i) and 1 == 0 && curr + nums[i] <= target) {
                    val newCurr = curr + nums[i]
                    val nxt = if (newCurr == target) 0 else newCurr
                    if (dfs(used or (1 shl i), nxt)) {
                        memo[key] = true
                        return true
                    }
                }
            }
            memo[key] = false
            return false
        }
        
        return dfs(0, 0)
    }
}
