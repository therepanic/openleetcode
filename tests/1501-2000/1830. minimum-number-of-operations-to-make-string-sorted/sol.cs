public class Solution {
    private const int MOD = 1000000007;
    
    public int MakeStringSorted(string s) {
        int n = s.Length;
        long[] fac = new long[n + 1];
        long[] invFac = new long[n + 1];
        fac[0] = 1;
        for (int i = 1; i <= n; i++) {
            fac[i] = (fac[i - 1] * i) % MOD;
        }
        invFac[n] = ModPow(fac[n], MOD - 2);
        for (int i = n; i > 0; i--) {
            invFac[i - 1] = (invFac[i] * i) % MOD;
        }
        
        int[] freq = new int[26];
        foreach (char c in s) {
            freq[c - 'a']++;
        }
        
        long ans = 0;
        for (int i = 0; i < n; i++) {
            int smallRight = 0;
            for (int j = 0; j < s[i] - 'a'; j++) {
                smallRight = (smallRight + freq[j]) % MOD;
            }
            
            int rem = n - i - 1;
            long temp = 1;
            temp = (temp * fac[rem]) % MOD;
            temp = (temp * smallRight) % MOD;
            
            foreach (int x in freq) {
                if (x > 1) {
                    temp = (temp * invFac[x]) % MOD;
                }
            }
            
            freq[s[i] - 'a']--;
            ans = (ans + temp) % MOD;
        }
        
        return (int) ans;
    }
    
    private long ModPow(long x, long n) {
        if (x == 1 || n == 0) return 1;
        if (n == 1) return x % MOD;
        if (n % 2 == 1) {
            return (x * ModPow((x * x) % MOD, n / 2)) % MOD;
        }
        return ModPow((x * x) % MOD, n / 2) % MOD;
    }
}
