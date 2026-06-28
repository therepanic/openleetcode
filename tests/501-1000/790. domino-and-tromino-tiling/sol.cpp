class Solution {
public:
    static const int MOD = 1000000007;

    vector<vector<long long>> multiply(vector<vector<long long>>& A, vector<vector<long long>>& B) {
        vector<vector<long long>> C(3, vector<long long>(3, 0));
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                long long s = 0;
                for (int k = 0; k < 3; k++) {
                    s = (s + A[i][k] * B[k][j]) % MOD;
                }
                C[i][j] = s;
            }
        }
        return C;
    }

    vector<vector<long long>> power(vector<vector<long long>> base, int exp) {
        vector<vector<long long>> result = {{1,0,0},{0,1,0},{0,0,1}};
        while (exp > 0) {
            if (exp & 1) {
                result = multiply(result, base);
            }
            base = multiply(base, base);
            exp >>= 1;
        }
        return result;
    }

    int numTilings(int n) {
        if (n == 0) return 1;
        if (n == 1) return 1;
        if (n == 2) return 2;
        vector<vector<long long>> t = {{2,0,1},{1,0,0},{0,1,0}};
        auto p = power(t, n - 2);
        return (p[0][0] * 2 + p[0][1] + p[0][2]) % MOD;
    }
};
