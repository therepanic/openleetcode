public class Solution {
    public int NthSuperUglyNumber(int n, int[] primes) {
        int[] ugly = new int[n];
        ugly[0] = 1;
        int[] idx = new int[primes.Length];
        int[] val = new int[primes.Length];
        for (int j = 0; j < primes.Length; j++) {
            val[j] = primes[j];
        }
        for (int i = 1; i < n; i++) {
            int m = val.Min();
            ugly[i] = m;
            for (int j = 0; j < primes.Length; j++) {
                if (val[j] == m) {
                    idx[j]++;
                    val[j] = ugly[idx[j]] * primes[j];
                }
            }
        }
        return ugly[n - 1];
    }
}
