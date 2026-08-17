public class Solution {
    public int TotalMoney(int n) {
        int q = n / 7;
        int r = n % 7;
        return ArithmeticProgression(28, 28+(q-1)*7, q) + ArithmeticProgression(q+1, q+r, r);
    }
    private int ArithmeticProgression(int leading, int last, int terms) {
        return (leading+last)*terms/2;
    }
}
