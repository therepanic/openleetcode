public class Solution {
    public bool CanConvertString(string s, string t, int k) {
        if (s.Length != t.Length) return false;
        int[] shiftCount = new int[26];
        for (int i = 0; i < s.Length; i++) {
            if (s[i] == t[i]) continue;
            int diff = (t[i] - s[i] + 26) % 26;
            shiftCount[diff]++;
            if (diff + 26 * (shiftCount[diff] - 1) > k) return false;
        }
        return true;
    }
}
