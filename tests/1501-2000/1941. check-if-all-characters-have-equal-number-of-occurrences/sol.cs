public class Solution {
    public bool AreOccurrencesEqual(string s) {
        var freq = new Dictionary<char, int>();
        foreach (char c in s) {
            freq[c] = freq.GetValueOrDefault(c) + 1;
        }
        return freq.Values.ToHashSet().Count == 1;
    }
}
