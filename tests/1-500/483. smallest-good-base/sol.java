import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;

class Solution {
    public String smallestGoodBase(String n) {
        BigDecimal nDec = new BigDecimal(n);
        MathContext mc = new MathContext(26);
        
        for (int m = 60; m >= 2; m--) {
            BigDecimal k = new BigDecimal("2");
            for (int i = 0; i < 300; i++) {
                k = newtonMethod(k, m, nDec, mc);
            }
            
            BigDecimal roundedK = k.setScale(0, RoundingMode.HALF_UP);
            if (k.setScale(6, RoundingMode.HALF_UP).compareTo(roundedK) == 0 && roundedK.compareTo(BigDecimal.ONE) > 0) {
                return roundedK.toPlainString();
            }
        }
        return "";
    }
    
    private BigDecimal newtonMethod(BigDecimal k, int m, BigDecimal n, MathContext mc) {
        BigDecimal one = BigDecimal.ONE;
        BigDecimal kMinus1 = k.subtract(one, mc);
        BigDecimal kPowM = k.pow(m, mc);
        
        BigDecimal numerator = kPowM.subtract(one, mc)
            .divide(kMinus1, mc)
            .subtract(n, mc);
        
        BigDecimal denominatorPt1 = new BigDecimal(m)
            .multiply(kMinus1, mc)
            .multiply(k.pow(m - 1, mc), mc)
            .subtract(kPowM.subtract(one, mc), mc);
        
        BigDecimal denominatorPt2 = kMinus1.pow(2, mc);
        BigDecimal totalDenom = denominatorPt1.divide(denominatorPt2, mc);
        
        return k.subtract(numerator.divide(totalDenom, mc), mc);
    }
}
