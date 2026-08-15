import kotlin.math.max

class Solution {
    fun secondHighest(s: String): Int {
        val digits = s.filter { it.isDigit() }.map { it - '0' }.toSet()
        return if (digits.size > 1) {
            val max = digits.maxOrNull()!!
            digits.filter { it != max }.maxOrNull() ?: -1
        } else -1
    }
}
