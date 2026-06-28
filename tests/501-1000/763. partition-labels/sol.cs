public class Solution {
    public IList<int> PartitionLabels(string s) {
        if (s.Length == 1) {
            return new List<int> { 1 };
        }
        Dictionary<char, List<int>> seen = new Dictionary<char, List<int>>();
        for (int i = 0; i < s.Length; i++) {
            char ch = s[i];
            if (!seen.ContainsKey(ch)) {
                seen[ch] = new List<int> { i, i };
            } else {
                seen[ch][1] = i;
            }
        }
        List<List<int>> arrSeen = new List<List<int>>(seen.Values);
        List<List<int>> merged = new List<List<int>> { arrSeen[0] };
        for (int i = 1; i < arrSeen.Count; i++) {
            List<int> last = merged[merged.Count - 1];
            List<int> cur = arrSeen[i];
            if (last[1] >= cur[0]) {
                last[1] = Math.Max(last[1], cur[1]);
            } else {
                merged.Add(cur);
            }
        }
        List<int> ans = new List<int>();
        foreach (var interval in merged) {
            ans.Add(interval[1] - interval[0] + 1);
        }
        return ans;
    }
}
