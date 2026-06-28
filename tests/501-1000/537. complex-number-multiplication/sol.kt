class Solution {
    fun complexNumberMultiply(num1: String, num2: String): String {
        fun parseComplex(s: String): Pair<Int, Int> {
            val parts = s.split("+")
            val real = parts[0].toInt()
            val imag = parts[1].dropLast(1).toInt()
            return Pair(real, imag)
        }
        
        val (a, b) = parseComplex(num1)
        val (c, d) = parseComplex(num2)
        val realPart = a * c - b * d
        val imagPart = a * d + b * c
        return "$realPart+${imagPart}i"
    }
}
