public class Solution {
    public string ShortestCompletingWord(string licensePlate, string[] words) {
        int[] lp = new int[26];
        foreach (char c in licensePlate.ToLower()) {
            if (char.IsLetter(c)) {
                lp[c - 'a']++;
            }
        }
        string ans = null;
        foreach (string w in words) {
            int[] cw = new int[26];
            foreach (char c in w) {
                cw[c - 'a']++;
            }
            bool ok = true;
            for (int i = 0; i < 26; i++) {
                if (cw[i] < lp[i]) {
                    ok = false;
                    break;
                }
            }
            if (ok && (ans == null || w.Length < ans.Length)) {
                ans = w;
            }
        }
        return ans;
    }
}
