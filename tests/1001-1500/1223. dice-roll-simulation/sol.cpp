class Solution {
public:
    int dieSimulator(int n, vector<int>& rollMax) {
        const int MOD = 1e9 + 7;
        int faces = 6;

        vector<vector<long long>> f(n, vector<long long>(faces, 0));
        vector<long long> s(n, 0);

        for (int j = 0; j < faces; j++) {
            f[0][j] = 1;
        }
        s[0] = faces;

        for (int i = 1; i < n; i++) {
            for (int j = 0; j < faces; j++) {
                int maxRepeat = rollMax[j];
                long long res = s[i - 1];

                if (i > maxRepeat) {
                    res -= (s[i - maxRepeat - 1] - f[i - maxRepeat - 1][j]);
                } else if (i == maxRepeat) {
                    res -= 1;
                }

                f[i][j] = ((res % MOD) + MOD) % MOD;
            }

            long long sum = 0;
            for (int j = 0; j < faces; j++) {
                sum = (sum + f[i][j]) % MOD;
            }
            s[i] = sum;
        }

        return s[n - 1];
    }
};
