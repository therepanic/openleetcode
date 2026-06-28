public class Solution {
    private const long MOD = 1_000_000_007;

    private long[][] Multiply(long[][] A, long[][] B) {
        long[][] C = new long[3][];
        for (int i = 0; i < 3; i++) {
            C[i] = new long[3];
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

    private long[][] Power(long[][] matrix, int exp) {
        long[][] result = new long[][] {
            new long[] {1, 0, 0},
            new long[] {0, 1, 0},
            new long[] {0, 0, 1}
        };
        while (exp > 0) {
            if ((exp & 1) == 1) {
                result = Multiply(result, matrix);
            }
            matrix = Multiply(matrix, matrix);
            exp >>= 1;
        }
        return result;
    }

    public int NumTilings(int n) {
        if (n == 0) return 1;
        if (n == 1) return 1;
        if (n == 2) return 2;
        long[][] t = new long[][] {
            new long[] {2, 0, 1},
            new long[] {1, 0, 0},
            new long[] {0, 1, 0}
        };
        long[][] p = Power(t, n - 2);
        return (int)((p[0][0] * 2 + p[0][1] + p[0][2]) % MOD);
    }
}
