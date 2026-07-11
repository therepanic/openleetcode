public class Solution {
    public IList<string> CommonChars(string[] words) {
        Dictionary<char, int> freq = new Dictionary<char, int>();
        foreach (char c in words[0]) {
            if (freq.ContainsKey(c)) {
                freq[c]++;
            } else {
                freq[c] = 1;
            }
        }
        for (int i = 1; i < words.Length; i++) {
            Dictionary<char, int> f = new Dictionary<char, int>();
            foreach (char c in words[i]) {
                if (f.ContainsKey(c)) {
                    f[c]++;
                } else {
                    f[c] = 1;
                }
            }
            foreach (char c in new List<char>(freq.Keys)) {
                if (f.ContainsKey(c)) {
                    freq[c] = Math.Min(f[c], freq[c]);
                } else {
                    freq[c] = 0;
                }
            }
        }
        IList<string> res = new List<string>();
        foreach (var kvp in freq) {
            for (int j = 0; j < kvp.Value; j++) {
                res.Add(kvp.Key.ToString());
            }
        }
        return res;
    }
}
