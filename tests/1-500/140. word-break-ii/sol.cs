public class Solution {
    public IList<string> WordBreak(string s, IList<string> wordDict) {
        var words = new HashSet<string>(wordDict);
        var memo = new Dictionary<string, IList<string>>();
        IList<string> Solve(string text) {
            if (memo.TryGetValue(text, out var found)) return found;
            var result = new List<string>();
            if (words.Contains(text)) result.Add(text);
            for (int i = 1; i < text.Length; i++) {
                var prefix = text.Substring(0, i);
                if (!words.Contains(prefix)) continue;
                foreach (var tail in Solve(text.Substring(i))) result.Add(prefix + " " + tail);
            }
            memo[text] = result;
            return result;
        }
        return Solve(s);
    }
}
