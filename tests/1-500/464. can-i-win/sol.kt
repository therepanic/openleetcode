class Solution {
    fun canIWin(maxChoosableInteger: Int, desiredTotal: Int): Boolean {
        if (desiredTotal <= 0) return true
        if ((1..maxChoosableInteger).sum() < desiredTotal) return false
        
        val memo = mutableMapOf<Int, Boolean>()
        
        fun canWin(state: Int, total: Int): Boolean {
            if (memo.containsKey(state)) return memo[state]!!
            
            for (i in 1..maxChoosableInteger) {
                val bit = 1 shl (i - 1)
                if ((state and bit) == 0) {
                    if (i >= total || !canWin(state or bit, total - i)) {
                        memo[state] = true
                        return true
                    }
                }
            }
            memo[state] = false
            return false
        }
        
        return canWin(0, desiredTotal)
    }
}
