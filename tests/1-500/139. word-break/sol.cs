public class Solution {
    public bool WordBreak(string s, IList<string> wordDict) {
        var words = new HashSet<string>(wordDict);
        int maxLen = wordDict.Count == 0 ? 0 : wordDict.Max(word => word.Length);
        var dp = new bool[s.Length + 1];
        dp[s.Length] = true;
        for (int i = s.Length - 1; i >= 0; i--) {
            for (int len = 1; len <= maxLen && i + len <= s.Length; len++) {
                if (words.Contains(s.Substring(i, len)) && dp[i + len]) { dp[i] = true; break; }
            }
        }
        return dp[0];
    }
}
