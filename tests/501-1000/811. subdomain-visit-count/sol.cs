public class Solution {
    public IList<string> SubdomainVisits(string[] cpdomains) {
        var freq = new Dictionary<string, int>();
        foreach (var entry in cpdomains) {
            var parts = entry.Split(' ');
            int cnt = int.Parse(parts[0]);
            string dom = parts[1];
            var subParts = dom.Split('.');
            for (int i = 0; i < subParts.Length; i++) {
                string sub = string.Join(".", subParts, i, subParts.Length - i);
                if (freq.ContainsKey(sub)) {
                    freq[sub] += cnt;
                } else {
                    freq[sub] = cnt;
                }
            }
        }
        var result = new List<string>();
        foreach (var kvp in freq) {
            result.Add(kvp.Value + " " + kvp.Key);
        }
        return result;
    }
}
