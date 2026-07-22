class Solution {
    public int distinctEchoSubstrings(String text) {
        int n = text.length();
        long b1 = 911382323, b2 = 972663749;
        long m1 = 1000000007, m2 = 1000000009;
        long[] p1 = new long[n + 1];
        long[] p2 = new long[n + 1];
        long[] h1 = new long[n + 1];
        long[] h2 = new long[n + 1];
        p1[0] = p2[0] = 1;
        int a = 'a';
        for (int i = 1; i <= n; i++) {
            int v = text.charAt(i - 1) - a;
            p1[i] = (p1[i - 1] * b1) % m1;
            p2[i] = (p2[i - 1] * b2) % m2;
            h1[i] = (h1[i - 1] * b1 + v) % m1;
            h2[i] = (h2[i - 1] * b2 + v) % m2;
        }
        java.util.HashSet<Long> st = new java.util.HashSet<>();
        for (int i = 0; i < n; i++) {
            int maxLen = (n - i) / 2;
            for (int L = 1; L <= maxLen; L++) {
                long[] left = get(i, i + L, h1, h2, p1, p2, m1, m2);
                long[] right = get(i + L, i + 2 * L, h1, h2, p1, p2, m1, m2);
                if (left[0] == right[0] && left[1] == right[1]) {
                    long[] whole = get(i, i + 2 * L, h1, h2, p1, p2, m1, m2);
                    long hash = (whole[0] << 32) | (whole[1] & 0xffffffffL);
                    st.add((((long) 2 * L) << 32) | (hash & 0xffffffffL));
                }
            }
        }
        return st.size();
    }
    
    private long[] get(int l, int r, long[] h1, long[] h2, long[] p1, long[] p2, long m1, long m2) {
        long v1 = (h1[r] - h1[l] * p1[r - l]) % m1;
        long v2 = (h2[r] - h2[l] * p2[r - l]) % m2;
        if (v1 < 0) v1 += m1;
        if (v2 < 0) v2 += m2;
        return new long[]{v1, v2};
    }
}
