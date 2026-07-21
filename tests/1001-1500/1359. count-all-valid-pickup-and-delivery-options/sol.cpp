class Solution {
public:
    int countOrders(int n) {
        const int MOD = 1000000007;
        long long count = 1;
        for (int i = 2; i <= n; i++) {
            count = (count * (2LL * i - 1) * i) % MOD;
        }
        return (int) count;
    }
};
