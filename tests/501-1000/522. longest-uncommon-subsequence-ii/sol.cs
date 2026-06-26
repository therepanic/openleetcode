public class Solution {
    public int FindLUSlength(string[] strs) {
        Array.Sort(strs, (a, b) => b.Length.CompareTo(a.Length));

        bool IsSubsequence(string s, string t) {
            int i = 0;
            foreach (char c in t) {
                if (i < s.Length && s[i] == c) i++;
            }
            return i == s.Length;
        }

        for (int i = 0; i < strs.Length; i++) {
            bool unique = true;
            for (int j = 0; j < strs.Length; j++) {
                if (i == j) continue;
                if (IsSubsequence(strs[i], strs[j])) {
                    unique = false;
                    break;
                }
            }
            if (unique) return strs[i].Length;
        }

        return -1;
    }
}
