class Solution {
    fun makesquare(matchsticks: IntArray): Boolean {
        val total = matchsticks.sum()
        if (total % 4 != 0) return false
        val side = total / 4
        
        matchsticks.sortDescending()
        
        val sides = IntArray(4)
        return backtrack(matchsticks, 0, sides, side)
    }
    
    private fun backtrack(matchsticks: IntArray, index: Int, sides: IntArray, side: Int): Boolean {
        if (index == matchsticks.size) {
            return sides.all { it == side }
        }
        for (i in 0 until 4) {
            if (sides[i] + matchsticks[index] <= side) {
                sides[i] += matchsticks[index]
                if (backtrack(matchsticks, index + 1, sides, side)) return true
                sides[i] -= matchsticks[index]
            }
        }
        return false
    }
}
