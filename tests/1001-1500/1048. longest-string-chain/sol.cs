public class Solution {
    public int LongestStrChain(string[] words) {
        Dictionary<string, int> chains = new Dictionary<string, int>();
        Array.Sort(words, (a, b) => a.Length.CompareTo(b.Length));
        
        foreach (string word in words) {
            chains[word] = 1;
            for (int i = 0; i < word.Length; i++) {
                string pred = word.Substring(0, i) + word.Substring(i + 1);
                if (chains.ContainsKey(pred)) {
                    chains[word] = Math.Max(chains[word], chains[pred] + 1);
                }
            }
        }
        
        int maxLen = 0;
        foreach (int len in chains.Values) {
            maxLen = Math.Max(maxLen, len);
        }
        return maxLen;
    }
}
