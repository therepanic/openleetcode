class Solution {
public:
    int makeStringSorted(string s) {
        const int MOD = 1000000007;
        int n = s.size();
        vector<long long> fac(n + 1, 1);
        vector<long long> invFac(n + 1, 1);
        
        for (int i = 1; i <= n; i++) {
            fac[i] = (fac[i - 1] * i) % MOD;
        }
        invFac[n] = modPow(fac[n], MOD - 2);
        for (int i = n; i > 0; i--) {
            invFac[i - 1] = (invFac[i] * i) % MOD;
        }
        
        vector<int> freq(26, 0);
        for (char c : s) {
            freq[c - 'a']++;
        }
        
        long long ans = 0;
        for (int i = 0; i < n; i++) {
            int smallRight = 0;
            for (int j = 0; j < s[i] - 'a'; j++) {
                smallRight = (smallRight + freq[j]) % MOD;
            }
            
            int rem = n - i - 1;
            long long temp = 1;
            temp = (temp * fac[rem]) % MOD;
            temp = (temp * smallRight) % MOD;
            
            for (int x : freq) {
                if (x > 1) {
                    temp = (temp * invFac[x]) % MOD;
                }
            }
            
            freq[s[i] - 'a']--;
            ans = (ans + temp) % MOD;
        }
        
        return (int) ans;
    }
    
private:
    long long modPow(long long x, long long n) {
        const int MOD = 1000000007;
        if (x == 1 || n == 0) return 1;
        if (n == 1) return x % MOD;
        if (n % 2 == 1) {
            return (x * modPow((x * x) % MOD, n / 2)) % MOD;
        }
        return modPow((x * x) % MOD, n / 2) % MOD;
    }
};
