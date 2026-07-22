public class Solution {
    public IList<string> SimplifiedFractions(int n) {
        IList<string> fractions = new List<string>();
        for (int numerator = 1; numerator < n; numerator++) {
            for (int denominator = numerator + 1; denominator <= n; denominator++) {
                if (Gcd(numerator, denominator) == 1) {
                    fractions.Add($"{numerator}/{denominator}");
                }
            }
        }
        return fractions;
    }
    
    private int Gcd(int a, int b) {
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }
}
