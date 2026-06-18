class Solution {
    public int nthSuperUglyNumber(int n, int[] primes) {
        int[] ugly = new int[n];
        ugly[0] = 1;
        int[] idx = new int[primes.length];
        long[] val = new long[primes.length];
        for (int j = 0; j < primes.length; j++) {
            val[j] = primes[j];
        }
        for (int i = 1; i < n; i++) {
            long m = val[0];
            for (int j = 1; j < val.length; j++) {
                long v = val[j];
                if (v < m) {
                    m = v;
                }
            }
            ugly[i] = (int)m;
            for (int j = 0; j < primes.length; j++) {
                if (val[j] == m) {
                    idx[j]++;
                    val[j] = (long)ugly[idx[j]] * primes[j];
                }
            }
        }
        return ugly[n - 1];
    }
}
