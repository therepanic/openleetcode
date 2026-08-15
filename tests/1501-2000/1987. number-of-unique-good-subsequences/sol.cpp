class Solution {
public:
    int numberOfUniqueGoodSubsequences(string binary) {
        long long a = 0, b = 0;
        int z = 0;
        const long long MOD = 1000000007;
        for (char c : binary) {
            if (c == '1') {
                b = (a + b + 1) % MOD;
            } else {
                a = (a + b) % MOD;
                z = 1;
            }
        }
        return (int)((a + b + z) % MOD);
    }
};
