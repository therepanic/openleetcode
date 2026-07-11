class Solution {
    public int numDupDigitsAtMostN(int n) {
        String s = Integer.toString(n + 1);
        int nl = s.length();
        int[] digits = new int[nl];
        for (int i = 0; i < nl; i++) {
            digits[i] = s.charAt(i) - '0';
        }
        int res = 0;
        for (int i = 0; i < nl - 1; i++) {
            res += 9 * perm(9, i);
        }
        boolean[] used = new boolean[10];
        for (int i = 0; i < nl; i++) {
            int x = digits[i];
            int start = i == 0 ? 1 : 0;
            for (int y = start; y < x; y++) {
                if (!used[y]) {
                    res += perm(9 - i, nl - i - 1);
                }
            }
            if (used[x]) break;
            used[x] = true;
        }
        return n - res;
    }
    
    private int perm(int n, int k) {
        if (k < 0 || k > n) return 0;
        int ans = 1;
        for (int i = 0; i < k; i++) {
            ans *= (n - i);
        }
        return ans;
    }
}
