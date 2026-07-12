public class Solution {
    public bool BuddyStrings(string s, string goal) {
        if (s.Length != goal.Length) return false;
        if (s == goal) {
            return new HashSet<char>(s).Count < s.Length;
        }
        List<int> diffs = new List<int>();
        for (int i = 0; i < s.Length; i++) {
            if (s[i] != goal[i]) {
                diffs.Add(i);
            }
        }
        return diffs.Count == 2 && s[diffs[0]] == goal[diffs[1]] && s[diffs[1]] == goal[diffs[0]];
    }
}
