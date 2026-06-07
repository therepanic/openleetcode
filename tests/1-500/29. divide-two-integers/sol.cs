public class Solution {
    public int Divide(int dividend, int divisor) {
        if (dividend == int.MinValue && divisor == -1) return int.MaxValue;
        long q = (long)dividend / (long)divisor;
        if (q < int.MinValue) return int.MinValue;
        if (q > int.MaxValue) return int.MaxValue;
        return (int)q;
    }
}
