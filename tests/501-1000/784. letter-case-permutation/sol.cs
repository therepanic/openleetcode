public class Solution {
    public IList<string> LetterCasePermutation(string s) {
        IList<string> ans = new List<string>();
        Solve(0, "", s, ans);
        return ans;
    }
    
    private void Solve(int idx, string curr, string s, IList<string> ans) {
        if (idx == s.Length) {
            ans.Add(curr);
            return;
        }
        if (char.IsDigit(s[idx])) {
            Solve(idx + 1, curr + s[idx], s, ans);
            return;
        }
        Solve(idx + 1, curr + char.ToLower(s[idx]), s, ans);
        Solve(idx + 1, curr + char.ToUpper(s[idx]), s, ans);
    }
}
