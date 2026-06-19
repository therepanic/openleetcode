public class Solution {
    public string FrequencySort(string s) {
        Dictionary<char, int> freq = new Dictionary<char, int>();
        foreach (char c in s) {
            if (freq.ContainsKey(c))
                freq[c]++;
            else
                freq[c] = 1;
        }
        var sorted = freq.OrderByDescending(kvp => kvp.Value);
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        foreach (var kvp in sorted) {
            sb.Append(new string(kvp.Key, kvp.Value));
        }
        return sb.ToString();
    }
}
