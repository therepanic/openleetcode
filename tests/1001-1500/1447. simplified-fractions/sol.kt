class Solution {
    fun simplifiedFractions(n: Int): List<String> {
        val fractions = mutableListOf<String>()
        for (numerator in 1 until n) {
            for (denominator in numerator + 1..n) {
                if (gcd(numerator, denominator) == 1) {
                    fractions.add("$numerator/$denominator")
                }
            }
        }
        return fractions
    }
    
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
}
