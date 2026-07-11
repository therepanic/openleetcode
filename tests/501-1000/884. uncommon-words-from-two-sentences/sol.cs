public class Solution {
    public string[] UncommonFromSentences(string s1, string s2) {
        var words = (s1 + " " + s2).Split(' ');
        var count = new Dictionary<string, int>();
        foreach (var word in words) {
            if (count.ContainsKey(word)) count[word]++;
            else count[word] = 1;
        }
        var result = new List<string>();
        foreach (var pair in count) {
            if (pair.Value == 1) result.Add(pair.Key);
        }
        return result.ToArray();
    }
}
