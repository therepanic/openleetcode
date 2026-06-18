public class Solution {
    public int NthSuperUglyNumber(int n, int[] primes) {
        int[] ugly = new int[n];
        ugly[0] = 1;
        int[] idx = new int[primes.Length];
        long[] val = new long[primes.Length];
        for (int j = 0; j < primes.Length; j++) {
            val[j] = primes[j];
        }
        for (int i = 1; i < n; i++) {
            long m = val[0];
            for (int j = 1; j < val.Length; j++) {
                if (val[j] < m) {
                    m = val[j];
                }
            }
            ugly[i] = (int)m;
            for (int j = 0; j < primes.Length; j++) {
                if (val[j] == m) {
                    idx[j]++;
                    val[j] = (long)ugly[idx[j]] * primes[j];
                }
            }
        }
        return ugly[n - 1];
    }
}
