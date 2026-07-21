public class Solution {
    public int CountOrders(int n) {
        const int MOD = 1000000007;
        long count = 1;
        for (int i = 2; i <= n; i++) {
            count = (count * (2L * i - 1) * i) % MOD;
        }
        return (int) count;
    }
}
