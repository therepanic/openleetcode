public class Solution {
    public string LongestPrefix(string s) {
        int n = s.Length;
        int[] prefix = new int[n];
        int matched = 0;
        for (int i = 1; i < n; i++) {
            while (matched > 0 && s[i] != s[matched]) {
                matched = prefix[matched - 1];
            }
            if (s[i] == s[matched]) {
                matched++;
            }
            prefix[i] = matched;
        }
        return s.Substring(0, prefix[n - 1]);
    }
}
