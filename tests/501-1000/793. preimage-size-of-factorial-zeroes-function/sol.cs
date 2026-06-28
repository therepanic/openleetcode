public class Solution {
    public int PreimageSizeFZF(int k) {
        long TrailingZeroes(long n) {
            long count = 0;
            long power = 5;
            while (power <= n) {
                count += n / power;
                power *= 5;
            }
            return count;
        }

        long start = 4L * k;
        while (true) {
            long H = TrailingZeroes(start);
            if (H == k) {
                return 5;
            }
            if (H > k) {
                break;
            }
            start++;
        }
        return 0;
    }
}
