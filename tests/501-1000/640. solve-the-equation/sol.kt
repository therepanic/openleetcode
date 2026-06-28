class Solution {
    fun solveEquation(equation: String): String {
        val (left, right) = equation.split("=")
        
        fun parseSide(side: String): Pair<Int, Int> {
            var coeff = 0
            var constant = 0
            var num = ""
            var sign = 1
            for (char in side + "+") {
                when {
                    char == '+' || char == '-' -> {
                        if (num.isNotEmpty()) {
                            constant += sign * num.toInt()
                            num = ""
                        }
                        sign = if (char == '+') 1 else -1
                    }
                    char.isDigit() -> num += char
                    char == 'x' -> {
                        coeff += sign * (if (num.isNotEmpty()) num.toInt() else 1)
                        num = ""
                    }
                }
            }
            return Pair(coeff, constant)
        }
        
        val (leftCoeff, leftConst) = parseSide(left)
        val (rightCoeff, rightConst) = parseSide(right)
        
        val coeff = leftCoeff - rightCoeff
        val constant = rightConst - leftConst
        
        return when {
            coeff == 0 && constant != 0 -> "No solution"
            coeff == 0 -> "Infinite solutions"
            else -> "x=${constant / coeff}"
        }
    }
}
