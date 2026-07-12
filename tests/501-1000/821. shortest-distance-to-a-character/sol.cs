public class Solution {
    public int[] ShortestToChar(string s, char c) {
        int n = s.Length;
        int[] ans = new int[n];
        int prev = -n;
        for (int i = 0; i < n; i++) {
            if (s[i] == c) {
                prev = i;
            }
            ans[i] = i - prev;
        }
        prev = 2 * n;
        for (int i = n - 1; i >= 0; i--) {
            if (s[i] == c) {
                prev = i;
            }
            ans[i] = Math.Min(ans[i], prev - i);
        }
        return ans;
    }
}
