public class Solution {
    public IList<bool> CamelMatch(string[] queries, string pattern) {
        IList<bool> ans = new List<bool>();
        foreach (string query in queries) {
            int j = 0;
            int i = 0;
            while (i < query.Length) {
                if (char.IsUpper(query[i]) && ((j < pattern.Length && query[i] != pattern[j]) || j > pattern.Length - 1)) {
                    break;
                }
                if (j < pattern.Length && query[i] == pattern[j]) {
                    j++;
                }
                i++;
            }
            if (i == query.Length && j == pattern.Length) {
                ans.Add(true);
            } else {
                ans.Add(false);
            }
        }
        return ans;
    }
}
