class Solution {
    private fun gcd(a: Int, b: Int): Int {
        var x = a
        var y = b
        while (y != 0) {
            val temp = y
            y = x % y
            x = temp
        }
        return x
    }

    fun fractionAddition(expression: String): String {
        val fractions = mutableListOf<Pair<Int, Int>>()
        var i = 0
        while (i < expression.length) {
            val sign: Char
            if (expression[i] == '+' || expression[i] == '-') {
                sign = expression[i]
                i++
            } else {
                sign = '+'
            }
            var numerator = 0
            while (i < expression.length && expression[i].isDigit()) {
                numerator = numerator * 10 + (expression[i] - '0')
                i++
            }
            i++ // skip '/'
            var denominator = 0
            while (i < expression.length && expression[i].isDigit()) {
                denominator = denominator * 10 + (expression[i] - '0')
                i++
            }
            if (sign == '-') {
                numerator = -numerator
            }
            fractions.add(Pair(numerator, denominator))
        }

        var commonDenominator = 1
        for ((_, denominator) in fractions) {
            commonDenominator *= denominator / gcd(commonDenominator, denominator)
        }

        var totalNumerator = 0
        for ((numerator, denominator) in fractions) {
            totalNumerator += numerator * (commonDenominator / denominator)
        }

        val gcdResult = gcd(kotlin.math.abs(totalNumerator), commonDenominator)
        totalNumerator /= gcdResult
        commonDenominator /= gcdResult

        return "$totalNumerator/$commonDenominator"
    }
}
