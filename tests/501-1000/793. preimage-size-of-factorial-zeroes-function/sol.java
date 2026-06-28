class Solution {
    public int preimageSizeFZF(int k) {
        long start = 4L * k;
        while (true) {
            long H = trailingZeroes(start);
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
    
    private long trailingZeroes(long n) {
        long count = 0;
        long power = 5;
        while (power <= n) {
            count += n / power;
            power *= 5;
        }
        return count;
    }
}
