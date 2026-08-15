class Solution {
public:
    int numberOfGoodSubsets(vector<int>& nums) {
        const long long MOD = 1000000007;
        const int primes[10] = {2,3,5,7,11,13,17,19,23,29};
        int freq[31] = {};
        for (int x : nums) ++freq[x];
        int masks[31] = {};
        for (int x = 2; x <= 30; ++x) {
            int y = x, mask = 0; bool ok = true;
            for (int b = 0; b < 10; ++b) {
                int p = primes[b];
                if (y % (p * p) == 0) { ok = false; break; }
                if (y % p == 0) mask |= 1 << b;
            }
            if (ok) masks[x] = mask;
        }
        long long dp[1024] = {}; dp[0] = 1;
        for (int x = 2; x <= 30; ++x) {
            int mask = masks[x];
            if (mask == 0 || freq[x] == 0) continue;
            for (int state = 1023; state >= 0; --state)
                if ((state & mask) == 0)
                    dp[state | mask] = (dp[state | mask] + dp[state] * freq[x]) % MOD;
        }
        long long ans = 0;
        for (int state = 1; state < 1024; ++state) ans = (ans + dp[state]) % MOD;
        for (int i = 0; i < freq[1]; ++i) ans = ans * 2 % MOD;
        return (int)ans;
    }
};
