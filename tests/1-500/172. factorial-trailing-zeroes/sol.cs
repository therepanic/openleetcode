public class Solution {
    public int TrailingZeroes(int n) {
        int count = 0;
        long divisor = 5;
        while (divisor <= n) {
            count += (int)(n / divisor);
            divisor *= 5;
        }
        return count;
    }
}
