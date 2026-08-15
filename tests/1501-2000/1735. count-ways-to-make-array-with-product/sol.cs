public class Solution {
    private const int MOD = 1_000_000_007;
    
    public int[] WaysToFillArray(int[][] queries) {
        var result = new int[queries.Length];
        for (int i = 0; i < queries.Length; i++) {
            int n = queries[i][0];
            int k = queries[i][1];
            var factors = PrimeFactors(k);
            long total = 1;
            foreach (var cnt in factors.Values) {
                total = total * Comb(n + cnt - 1, n - 1) % MOD;
            }
            result[i] = (int)total;
        }
        return result;
    }
    
    private Dictionary<int, int> PrimeFactors(int n) {
        var dict = new Dictionary<int, int>();
        int p = 2;
        while (p * p <= n) {
            while (n % p == 0) {
                if (dict.ContainsKey(p)) dict[p]++;
                else dict[p] = 1;
                n /= p;
            }
            p++;
        }
        if (n > 1) {
            if (dict.ContainsKey(n)) dict[n]++;
            else dict[n] = 1;
        }
        return dict;
    }
    
    private long Comb(int n, int r) {
        r = Math.Min(r, n - r);
        long result = 1;
        for (int i = 1; i <= r; i++) result = result * (n - i + 1) % MOD * ModPow(i, MOD - 2) % MOD;
        return result;
    }

    private long ModPow(long a, long e) { long r = 1; while (e > 0) { if ((e & 1) != 0) r = r * a % MOD; a = a * a % MOD; e >>= 1; } return r; }
}
