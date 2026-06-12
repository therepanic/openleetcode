public class Solution {
    public string FractionToDecimal(int numerator, int denominator) {
        if (numerator == 0) {
            return "0";
        }
        var result = new System.Text.StringBuilder();
        if ((numerator < 0) ^ (denominator < 0)) {
            result.Append('-');
        }
        long num = System.Math.Abs((long)numerator);
        long den = System.Math.Abs((long)denominator);
        result.Append(num / den);
        long rem = num % den;
        if (rem == 0) {
            return result.ToString();
        }
        result.Append('.');
        var seen = new System.Collections.Generic.Dictionary<long, int>();
        while (rem != 0) {
            if (seen.ContainsKey(rem)) {
                result.Insert(seen[rem], "(");
                result.Append(')');
                break;
            }
            seen[rem] = result.Length;
            rem *= 10;
            result.Append(rem / den);
            rem %= den;
        }
        return result.ToString();
    }
}
