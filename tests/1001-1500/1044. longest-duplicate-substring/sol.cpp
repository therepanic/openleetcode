class Solution {
public:
    string longestDupSubstring(string s) {
        int n = s.size();
        long long base1 = 131, base2 = 31;
        long long mod1 = 1000000005, mod2 = 1000000007;

        vector<long long> h1(n + 1), p1(n + 1, 1);
        vector<long long> h2(n + 1), p2(n + 1, 1);

        for (int i = 0; i < n; i++) {
            h1[i + 1] = (h1[i] * base1 + s[i]) % mod1;
            p1[i + 1] = (p1[i] * base1) % mod1;
            h2[i + 1] = (h2[i] * base2 + s[i]) % mod2;
            p2[i + 1] = (p2[i] * base2) % mod2;
        }

        auto check = [&](int L) -> string {
            unordered_set<long long> seen;
            for (int i = 0; i <= n - L; i++) {
                long long v1 = (h1[i + L] - h1[i] * p1[L]) % mod1;
                if (v1 < 0) v1 += mod1;
                long long v2 = (h2[i + L] - h2[i] * p2[L]) % mod2;
                if (v2 < 0) v2 += mod2;
                long long key = (v1 << 32) | v2;
                if (seen.count(key)) return s.substr(i, L);
                seen.insert(key);
            }
            return "";
        };

        int lo = 1, hi = n;
        string res;
        while (lo <= hi) {
            int mid = (lo + hi) / 2;
            string t = check(mid);
            if (!t.empty()) {
                res = t;
                lo = mid + 1;
            } else {
                hi = mid - 1;
            }
        }
        return res;
    }
};
