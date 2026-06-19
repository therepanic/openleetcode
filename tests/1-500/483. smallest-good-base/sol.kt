import java.math.BigDecimal
import java.math.MathContext
import java.math.RoundingMode

class Solution {
    fun smallestGoodBase(n: String): String {
        val nDec = BigDecimal(n)
        val mc = MathContext(26)
        
        for (m in 60 downTo 2) {
            var k = BigDecimal("2")
            for (i in 0 until 300) {
                k = newtonMethod(k, m, nDec, mc)
            }
            
            val roundedK = k.setScale(0, RoundingMode.HALF_UP)
            if (k.setScale(6, RoundingMode.HALF_UP).compareTo(roundedK) == 0 && roundedK > BigDecimal.ONE) {
                return roundedK.toPlainString()
            }
        }
        return ""
    }
    
    private fun newtonMethod(k: BigDecimal, m: Int, n: BigDecimal, mc: MathContext): BigDecimal {
        val one = BigDecimal.ONE
        val kMinus1 = k.subtract(one, mc)
        val kPowM = k.pow(m, mc)
        
        val numerator = kPowM.subtract(one, mc)
            .divide(kMinus1, mc)
            .subtract(n, mc)
        
        val denominatorPt1 = BigDecimal(m)
            .multiply(kMinus1, mc)
            .multiply(k.pow(m - 1, mc), mc)
            .subtract(kPowM.subtract(one, mc), mc)
        
        val denominatorPt2 = kMinus1.pow(2, mc)
        val totalDenom = denominatorPt1.divide(denominatorPt2, mc)
        
        return k.subtract(numerator.divide(totalDenom, mc), mc)
    }
}
