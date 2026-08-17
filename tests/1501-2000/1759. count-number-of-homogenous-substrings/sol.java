class Solution {
    public int countHomogenous(String s) {
        long mod = 1_000_000_007L;
        int n = s.length();
        long res = 1;
        int cnt = 1;
        for (int i = 1; i < n; i++) {
            if (s.charAt(i) != s.charAt(i - 1)) {
                cnt = 0;
            }
            cnt++;
            res = (res + cnt) % mod;
        }
        return (int) res;
    }
}
