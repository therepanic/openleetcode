public class Solution {
    public int NumDupDigitsAtMostN(int n) {
        string s = (n + 1).ToString();
        int[] digits = new int[s.Length];
        for (int i = 0; i < s.Length; i++) {
            digits[i] = s[i] - '0';
        }
        int nl = digits.Length;
        int res = 0;
        for (int i = 0; i < nl - 1; i++) {
            res += 9 * Perm(9, i);
        }
        bool[] used = new bool[10];
        for (int i = 0; i < nl; i++) {
            int x = digits[i];
            int start = i == 0 ? 1 : 0;
            for (int y = start; y < x; y++) {
                if (!used[y]) {
                    res += Perm(9 - i, nl - i - 1);
                }
            }
            if (used[x]) break;
            used[x] = true;
        }
        return n - res;
    }
    
    private int Perm(int n, int k) {
        if (k < 0 || k > n) return 0;
        int ans = 1;
        for (int i = 0; i < k; i++) {
            ans *= (n - i);
        }
        return ans;
    }
}
