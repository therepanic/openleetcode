public class Solution {
    public int UniqueLetterString(string s) {
        int n = s.Length;
        int[] left = new int[n];
        int[] right = new int[n];
        int[] prev = new int[26];
        for (int i = 0; i < 26; i++) prev[i] = -1;

        for (int i = 0; i < n; i++) {
            int idx = s[i] - 'A';
            left[i] = prev[idx];
            prev[idx] = i;
        }

        for (int i = 0; i < 26; i++) prev[i] = n;

        for (int i = n - 1; i >= 0; i--) {
            int idx = s[i] - 'A';
            right[i] = prev[idx];
            prev[idx] = i;
        }

        int ans = 0;
        for (int i = 0; i < n; i++) {
            ans += (i - left[i]) * (right[i] - i);
        }
        return ans;
    }
}
