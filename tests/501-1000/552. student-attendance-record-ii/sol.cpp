class Solution {
public:
    int checkRecord(int n) {
        const int mod = 1000000007;
        int dp[2][3] = {{1, 0, 0}, {0, 0, 0}};
        
        for (int i = 0; i < n; i++) {
            int ndp[2][3] = {{0, 0, 0}, {0, 0, 0}};
            for (int absences = 0; absences < 2; absences++) {
                for (int lates = 0; lates < 3; lates++) {
                    int cur = dp[absences][lates];
                    if (cur == 0) continue;
                    ndp[absences][0] = (ndp[absences][0] + cur) % mod;
                    if (absences == 0) {
                        ndp[1][0] = (ndp[1][0] + cur) % mod;
                    }
                    if (lates < 2) {
                        ndp[absences][lates + 1] = (ndp[absences][lates + 1] + cur) % mod;
                    }
                }
            }
            for (int a = 0; a < 2; a++) {
                for (int l = 0; l < 3; l++) {
                    dp[a][l] = ndp[a][l];
                }
            }
        }
        
        int total = 0;
        for (int a = 0; a < 2; a++) {
            for (int l = 0; l < 3; l++) {
                total = (total + dp[a][l]) % mod;
            }
        }
        return total;
    }
};
