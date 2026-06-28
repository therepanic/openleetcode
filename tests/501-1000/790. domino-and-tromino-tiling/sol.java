class Solution {
    private static final int MOD = 1_000_000_007;

    private long[][] multiply(long[][] A, long[][] B) {
        long[][] C = new long[3][3];
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                long s = 0;
                for (int k = 0; k < 3; k++) {
                    s = (s + A[i][k] * B[k][j]) % MOD;
                }
                C[i][j] = s;
            }
        }
        return C;
    }

    private long[][] power(long[][] base, int exp) {
        long[][] result = {{1,0,0},{0,1,0},{0,0,1}};
        while (exp > 0) {
            if ((exp & 1) == 1) {
                result = multiply(result, base);
            }
            base = multiply(base, base);
            exp >>= 1;
        }
        return result;
    }

    public int numTilings(int n) {
        if (n == 0) return 1;
        if (n == 1) return 1;
        if (n == 2) return 2;
        long[][] t = {{2,0,1},{1,0,0},{0,1,0}};
        long[][] p = power(t, n - 2);
        return (int)((p[0][0] * 2 + p[0][1] + p[0][2]) % MOD);
    }
}
