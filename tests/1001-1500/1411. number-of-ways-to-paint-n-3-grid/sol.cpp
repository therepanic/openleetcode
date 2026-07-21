class Solution {
public:
    int numOfWays(int n) {
        const int MOD = 1000000007;
        long long x = 6, y = 6;
        
        for (int i = 2; i <= n; i++) {
            long long newX = (3 * x + 2 * y) % MOD;
            long long newY = (2 * x + 2 * y) % MOD;
            x = newX;
            y = newY;
        }
        
        return (int)((x + y) % MOD);
    }
};
