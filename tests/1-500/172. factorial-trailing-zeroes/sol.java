class Solution {
    public int trailingZeroes(int n) {
        int count = 0;
        long divisor = 5;
        while (divisor <= n) {
            count += n / divisor;
            divisor *= 5;
        }
        return count;
    }
}
