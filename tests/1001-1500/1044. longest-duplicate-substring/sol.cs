public class Solution {
    public string LongestDupSubstring(string s) {
        int n = s.Length;
        long base1 = 131, base2 = 31;
        long mod1 = 1000000005, mod2 = 1000000007;

        long[] h1 = new long[n + 1], p1 = new long[n + 1];
        long[] h2 = new long[n + 1], p2 = new long[n + 1];
        p1[0] = p2[0] = 1;

        for (int i = 0; i < n; i++) {
            h1[i + 1] = (h1[i] * base1 + s[i]) % mod1;
            p1[i + 1] = (p1[i] * base1) % mod1;
            h2[i + 1] = (h2[i] * base2 + s[i]) % mod2;
            p2[i + 1] = (p2[i] * base2) % mod2;
        }

        string Check(int L) {
            var seen = new HashSet<long>();
            for (int i = 0; i <= n - L; i++) {
                long v1 = (h1[i + L] - h1[i] * p1[L]) % mod1;
                if (v1 < 0) v1 += mod1;
                long v2 = (h2[i + L] - h2[i] * p2[L]) % mod2;
                if (v2 < 0) v2 += mod2;
                long key = (v1 << 32) ^ v2;
                if (seen.Contains(key)) return s.Substring(i, L);
                seen.Add(key);
            }
            return "";
        }

        int lo = 1, hi = n;
        string res = "";
        while (lo <= hi) {
            int mid = (lo + hi) / 2;
            string t = Check(mid);
            if (t != "") {
                res = t;
                lo = mid + 1;
            } else {
                hi = mid - 1;
            }
        }
        return res;
    }
}
