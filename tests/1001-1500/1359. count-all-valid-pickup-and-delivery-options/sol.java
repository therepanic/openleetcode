class Solution {
    public int countOrders(int n) {
        final int MOD = 1000000007;
        long count = 1;
        for (int i = 2; i <= n; i++) {
            count = (count * (2L * i - 1) * i) % MOD;
        }
        return (int) count;
    }
}
