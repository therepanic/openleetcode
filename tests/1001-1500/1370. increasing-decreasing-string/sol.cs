public class Solution {
    public string SortString(string s) {
        if (string.IsNullOrEmpty(s)) return "";
        int[] counts = new int[26];
        foreach (char c in s) {
            counts[c - 'a']++;
        }
        System.Text.StringBuilder ans = new System.Text.StringBuilder();
        bool added;
        do {
            added = false;
            for (int i = 0; i < 26; i++) {
                if (counts[i] > 0) {
                    ans.Append((char)('a' + i));
                    counts[i]--;
                    added = true;
                }
            }
            for (int i = 25; i >= 0; i--) {
                if (counts[i] > 0) {
                    ans.Append((char)('a' + i));
                    counts[i]--;
                    added = true;
                }
            }
        } while (added);
        return ans.ToString();
    }
}
