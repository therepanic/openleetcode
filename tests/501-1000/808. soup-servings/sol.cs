public class Solution {
    private Dictionary<(int, int), double> memo;
    
    public double SoupServings(int n) {
        if (n > 5000) {
            return 1.0;
        }
        int units = (int)Math.Ceiling(n / 25.0);
        memo = new Dictionary<(int, int), double>();
        return CalcProb(units, units);
    }
    
    private double CalcProb(int soupA, int soupB) {
        if (memo.TryGetValue((soupA, soupB), out double val)) {
            return val;
        }
        if (soupA <= 0 && soupB <= 0) {
            return 0.5;
        }
        if (soupA <= 0) {
            return 1.0;
        }
        if (soupB <= 0) {
            return 0.0;
        }
        double result = 0.25 * (
            CalcProb(soupA - 4, soupB) +
            CalcProb(soupA - 3, soupB - 1) +
            CalcProb(soupA - 2, soupB - 2) +
            CalcProb(soupA - 1, soupB - 3)
        );
        memo[(soupA, soupB)] = result;
        return result;
    }
}
