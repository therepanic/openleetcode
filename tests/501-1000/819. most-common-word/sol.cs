public class Solution {
    public string MostCommonWord(string paragraph, string[] banned) {
        var bannedSet = new HashSet<string>(banned);
        var counts = new Dictionary<string, int>();
        var words = System.Text.RegularExpressions.Regex.Split(paragraph.ToLower(), @"[^a-z]+");
        foreach (var w in words) {
            if (!string.IsNullOrEmpty(w) && !bannedSet.Contains(w)) {
                counts.TryGetValue(w, out int c);
                counts[w] = c + 1;
            }
        }
        string result = "";
        int maxCount = 0;
        foreach (var kv in counts) {
            if (kv.Value > maxCount) {
                maxCount = kv.Value;
                result = kv.Key;
            }
        }
        return result;
    }
}
