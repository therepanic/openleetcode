class Solution {
    fun scoreOfParentheses(s: String): Int {
        val scoreStack = mutableListOf(0)
        
        for (parentheses in s) {
            if (parentheses == '(') {
                scoreStack.add(0)
            } else if (scoreStack.isNotEmpty()) {
                val lastScore = scoreStack.removeAt(scoreStack.size - 1)
                scoreStack[scoreStack.size - 1] += maxOf(1, lastScore * 2)
            }
        }
        
        return scoreStack.last()
    }
}
