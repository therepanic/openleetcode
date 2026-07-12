public class Solution {
    public IList<string> FindAndReplacePattern(string[] words, string pattern) {
        var counts = pattern.Select(c => pattern.IndexOf(c)).ToList();
        var res = new List<string>();
        foreach (var word in words) {
            var count = word.Select(c => word.IndexOf(c)).ToList();
            if (count.SequenceEqual(counts)) {
                res.Add(word);
            }
        }
        return res;
    }
}
