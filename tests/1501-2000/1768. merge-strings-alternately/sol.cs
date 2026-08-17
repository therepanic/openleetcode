public class Solution {
    public string MergeAlternately(string word1, string word2) {
        var merged = new StringBuilder();
        int minLen = Math.Min(word1.Length, word2.Length);
        for (int i = 0; i < minLen; i++) {
            merged.Append(word1[i]).Append(word2[i]);
        }
        if (word1.Length > minLen) {
            merged.Append(word1.Substring(minLen));
        }
        if (word2.Length > minLen) {
            merged.Append(word2.Substring(minLen));
        }
        return merged.ToString();
    }
}
