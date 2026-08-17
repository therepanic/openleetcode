public class Solution {
    public int MaxUniqueSplit(string s) {
        var used = new HashSet<string>();
        int ans = 0;
        Backtrack(s, 0, used, ref ans);
        return ans;
    }
    
    private void Backtrack(string s, int index, HashSet<string> used, ref int ans) {
        if (index == s.Length) {
            ans = Math.Max(ans, used.Count);
            return;
        }
        for (int j = index; j < s.Length; j++) {
            string curr = s.Substring(index, j - index + 1);
            if (used.Contains(curr)) continue;
            used.Add(curr);
            Backtrack(s, j + 1, used, ref ans);
            used.Remove(curr);
        }
    }
}
