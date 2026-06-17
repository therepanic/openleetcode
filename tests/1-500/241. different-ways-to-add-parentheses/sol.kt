class Solution {
    fun diffWaysToCompute(expression: String): List<Int> {
        if (expression.all { it.isDigit() }) {
            return listOf(expression.toInt())
        }
        
        val results = mutableListOf<Int>()
        
        for (i in expression.indices) {
            val char = expression[i]
            if (char == '+' || char == '-' || char == '*') {
                val leftResults = diffWaysToCompute(expression.substring(0, i))
                val rightResults = diffWaysToCompute(expression.substring(i + 1))
                
                for (left in leftResults) {
                    for (right in rightResults) {
                        when (char) {
                            '+' -> results.add(left + right)
                            '-' -> results.add(left - right)
                            '*' -> results.add(left * right)
                        }
                    }
                }
            }
        }
        
        return results
    }
}
