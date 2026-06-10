class Solution {
    fun fractionToDecimal(numerator: Int, denominator: Int): String {
        if (numerator == 0) return "0"
        val result = StringBuilder()
        if ((numerator < 0) xor (denominator < 0)) {
            result.append('-')
        }
        val num = kotlin.math.abs(numerator.toLong())
        val den = kotlin.math.abs(denominator.toLong())
        result.append(num / den)
        var rem = num % den
        if (rem == 0L) return result.toString()
        result.append('.')
        val seen = HashMap<Long, Int>()
        while (rem != 0L) {
            val previous = seen[rem]
            if (previous != null) {
                result.insert(previous, '(')
                result.append(')')
                break
            }
            seen[rem] = result.length
            rem *= 10
            result.append(rem / den)
            rem %= den
        }
        return result.toString()
    }
}
