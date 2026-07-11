class Solution {
    public String longestDupSubstring(String s) {
        int n = s.length();
        long base1 = 131, base2 = 31;
        long mod1 = 1000000005L, mod2 = 1000000007L;

        long[] h1 = new long[n+1], p1 = new long[n+1];
        long[] h2 = new long[n+1], p2 = new long[n+1];
        p1[0] = p2[0] = 1;

        for (int i = 0; i < n; i++) {
            h1[i+1] = (h1[i] * base1 + s.charAt(i)) % mod1;
            p1[i+1] = (p1[i] * base1) % mod1;
            h2[i+1] = (h2[i] * base2 + s.charAt(i)) % mod2;
            p2[i+1] = (p2[i] * base2) % mod2;
        }

        int lo = 1, hi = n;
        String res = "";

        while (lo <= hi) {
            int mid = (lo + hi) / 2;
            String t = check(s, mid, h1, p1, h2, p2, mod1, mod2);
            if (t != "") {
                res = t;
                lo = mid + 1;
            } else {
                hi = mid - 1;
            }
        }
        return res;
    }

    private String check(String s, int L, long[] h1, long[] p1, long[] h2, long[] p2, long mod1, long mod2) {
        int n = s.length();
        java.util.Set<Long> seen = new java.util.HashSet<>();
        for (int i = 0; i <= n - L; i++) {
            long v1 = (h1[i+L] - h1[i] * p1[L]) % mod1;
            if (v1 < 0) v1 += mod1;
            long v2 = (h2[i+L] - h2[i] * p2[L]) % mod2;
            if (v2 < 0) v2 += mod2;
            long key = v1 * mod2 + v2;
            if (seen.contains(key)) return s.substring(i, i + L);
            seen.add(key);
        }
        return "";
    }
}
