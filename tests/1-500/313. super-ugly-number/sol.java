class Solution {
    public int nthSuperUglyNumber(int n, int[] primes) {
        int[] ugly = new int[n];
        ugly[0] = 1;
        int[] idx = new int[primes.length];
        int[] val = new int[primes.length];
        for (int j = 0; j < primes.length; j++) {
            val[j] = primes[j];
        }
        for (int i = 1; i < n; i++) {
            int m = Integer.MAX_VALUE;
            for (int v : val) {
                if (v < m) {
                    m = v;
                }
            }
            ugly[i] = m;
            for (int j = 0; j < primes.length; j++) {
                if (val[j] == m) {
                    idx[j]++;
                    val[j] = ugly[idx[j]] * primes[j];
                }
            }
        }
        return ugly[n - 1];
    }
}
