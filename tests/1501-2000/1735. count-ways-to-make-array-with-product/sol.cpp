class Solution {
public:
    vector<int> waysToFillArray(vector<vector<int>>& queries) {
        const int MOD = 1'000'000'007;
        vector<int> result;
        
        for (const auto& q : queries) {
            int n = q[0], k = q[1];
            auto factors = primeFactors(k);
            long long total = 1;
            for (auto& [_, cnt] : factors) {
                total = total * comb(n + cnt - 1, n - 1) % MOD;
            }
            result.push_back(total);
        }
        return result;
    }
    
private:
    unordered_map<int, int> primeFactors(int n) {
        unordered_map<int, int> map;
        int p = 2;
        while (p * p <= n) {
            while (n % p == 0) {
                map[p]++;
                n /= p;
            }
            p++;
        }
        if (n > 1) map[n]++;
        return map;
    }
    
    long long comb(int n, int r) {
        r = min(r, n - r);
        long long result = 1;
        for (int i = 1; i <= r; i++) result = result * (n - i + 1) % 1000000007 * modPow(i, 1000000005) % 1000000007;
        return result;
    }

    long long modPow(long long a, long long e) { long long r = 1; while (e) { if (e & 1) r = r * a % 1000000007; a = a * a % 1000000007; e >>= 1; } return r; }
};
