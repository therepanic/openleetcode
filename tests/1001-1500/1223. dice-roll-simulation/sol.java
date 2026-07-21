class Solution {
    public int dieSimulator(int n, int[] rollMax) {
        final int MOD = 1_000_000_007;
        int faces = 6;

        long[][] f = new long[n][faces];
        long[] s = new long[n];

        for (int j = 0; j < faces; j++) {
            f[0][j] = 1;
        }
        s[0] = faces;

        for (int i = 1; i < n; i++) {
            for (int j = 0; j < faces; j++) {
                int maxRepeat = rollMax[j];
                long res = s[i - 1];

                if (i > maxRepeat) {
                    res -= (s[i - maxRepeat - 1] - f[i - maxRepeat - 1][j]);
                } else if (i == maxRepeat) {
                    res -= 1;
                }

                f[i][j] = ((res % MOD) + MOD) % MOD;
            }

            long sum = 0;
            for (int j = 0; j < faces; j++) {
                sum = (sum + f[i][j]) % MOD;
            }
            s[i] = sum;
        }

        return (int) s[n - 1];
    }
}
