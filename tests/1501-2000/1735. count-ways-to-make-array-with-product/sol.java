class Solution {
    private static final int MOD = 1_000_000_007;
    
    public int[] waysToFillArray(int[][] queries) {
        int[] ans = new int[queries.length];
        for (int i = 0; i < queries.length; i++) {
            int n = queries[i][0];
            int k = queries[i][1];
            
            java.util.Map<Integer, Integer> factors = primeFactors(k);
            long total = 1;
            for (int cnt : factors.values()) {
                total = total * comb(n + cnt - 1, n - 1) % MOD;
            }
            ans[i] = (int) total;
        }
        return ans;
    }
    
    private java.util.Map<Integer, Integer> primeFactors(int n) {
        java.util.Map<Integer, Integer> map = new java.util.HashMap<>();
        int p = 2;
        while (p * p <= n) {
            while (n % p == 0) {
                map.put(p, map.getOrDefault(p, 0) + 1);
                n /= p;
            }
            p++;
        }
        if (n > 1) map.put(n, map.getOrDefault(n, 0) + 1);
        return map;
    }
    
    private long comb(int n, int r) {
        r = Math.min(r, n - r);
        long result = 1;
        for (int i = 1; i <= r; i++) result = result * (n - i + 1) % MOD * modPow(i, MOD - 2) % MOD;
        return result;
    }

    private long modPow(long a, long e) { long r = 1; while (e > 0) { if ((e & 1) != 0) r = r * a % MOD; a = a * a % MOD; e >>= 1; } return r; }
}
